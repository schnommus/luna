#
# This file is part of LUNA.
#
# Copyright (c) 2020 Great Scott Gadgets <info@greatscottgadgets.com>
# SPDX-License-Identifier: BSD-3-Clause

""" Interfaces to LUNA's PSRAM chips."""

import unittest

from amaranth import Const, Signal, Module, Cat, Elaboratable, Record, ClockSignal, ResetSignal, Instance
from amaranth.hdl.rec import DIR_FANIN, DIR_FANOUT
from amaranth.lib.cdc import FFSynchronizer

from ..test.utils import LunaGatewareTestCase, sync_test_case


class HyperBusPHY(Record):
    """ Record representing a 32-bit HyperBus interface for use with a 4:1 PHY module. """

    def __init__(self):
        super().__init__([
            ('clk_en', 2, DIR_FANOUT),
            ('dq', [
                ('i', 32, DIR_FANIN),
                ('o', 32, DIR_FANOUT),
                ('e', 1,  DIR_FANOUT),
            ]),
            ('rwds', [
                ('i', 4,  DIR_FANIN),
                ('o', 4,  DIR_FANOUT),
                ('e', 1,  DIR_FANOUT),
            ]),
            ('cs',     1, DIR_FANOUT),
            ('reset',  1, DIR_FANOUT),
        ])


class HyperRAMInterface(Elaboratable):
    """ Gateware interface to HyperRAM series self-refreshing DRAM chips.

    I/O port:
        B: phy              -- The primary physical connection to the DRAM chip.
        I: reset            -- An active-high signal used to provide a prolonged reset upon configuration.

        I: address[32]      -- The address to be targeted by the given operation.
        I: register_space   -- When set to 1, read and write requests target registers instead of normal RAM.
        I: perform_write    -- When set to 1, a transfer request is viewed as a write, rather than a read.
        I: single_page      -- If set, data accesses will wrap around to the start of the current page when done.
        I: start_transfer   -- Strobe that goes high for 1-8 cycles to request a read operation.
                               [This added duration allows other clock domains to easily perform requests.]
        I: final_word       -- Flag that indicates the current word is the last word of the transaction.

        O: read_data[32]    -- word that holds the 32 bits most recently read from the PSRAM
        I: write_data[32]   -- word that accepts the data to output during this transaction

        O: idle             -- High whenever the transmitter is idle (and thus we can start a new piece of data.)
        O: read_ready       -- Strobe that indicates when new data is ready for reading
        O: write_ready      -- Strobe that indicates `write_data` has been latched and is ready for new data
    """

    LOW_LATENCY_CLOCKS  = 3
    HIGH_LATENCY_CLOCKS = 5

    def __init__(self, *, phy):
        """
        Parmeters:
            phy           -- The RAM record that should be connected to this RAM chip.
        """

        #
        # I/O port.
        #
        self.phy              = phy
        self.reset            = Signal()

        # Control signals.
        self.address          = Signal(32)
        self.register_space   = Signal()
        self.perform_write    = Signal()
        self.single_page      = Signal()
        self.start_transfer   = Signal()
        self.final_word       = Signal()

        # Status signals.
        self.idle             = Signal()
        self.read_ready       = Signal()
        self.write_ready      = Signal()

        # Data signals.
        self.read_data        = Signal(32)
        self.write_data       = Signal(32)

        self.clk = Signal()


    def elaborate(self, platform):
        m = Module()

        #
        # Latched control/addressing signals.
        #
        is_read         = Signal()
        is_register     = Signal()
        current_address = Signal(32)
        is_multipage    = Signal()

        #
        # FSM datapath signals.
        #

        # Tracks whether we need to add an extra latency period between our
        # command and the data body.
        extra_latency   = Signal()

        # Tracks how many cycles of latency we have remaining between a command
        # and the relevant data stages.
        latency_clocks_remaining  = Signal(range(0, self.HIGH_LATENCY_CLOCKS + 1))

        # Store last values of DQ lines.
        # This is used to handle different data alignment cases.
        last_dq   = Signal.like(self.phy.dq.i)

        #
        # Core operation FSM.
        #

        # Provide defaults for our control/status signals.
        m.d.sync += [
            self.phy.clk_en     .eq(0b11),
            self.phy.cs         .eq(1),
            self.phy.rwds.e     .eq(0),
            self.phy.dq.e       .eq(0),
        ]
        m.d.comb += self.write_ready.eq(0),

        # Commands, in order of bytes sent:
        #   - WRBAAAAA
        #     W         => selects read or write; 1 = read, 0 = write
        #      R        => selects register or memory; 1 = register, 0 = memory
        #       B       => selects burst behavior; 0 = wrapped, 1 = linear
        #        AAAAA  => address bits [27:32]
        #
        #   - AAAAAAAA  => address bits [19:27]
        #   - AAAAAAAA  => address bits [11:19]
        #   - AAAAAAAA  => address bits [ 3:16]
        #   - 00000000  => [reserved]
        #   - 00000AAA  => address bits [ 0: 3]
        ca = Signal(48)
        m.d.comb += ca.eq(Cat(
            current_address[0:3],
            Const(0, 13),
            current_address[3:32],
            is_multipage,
            is_register,
            is_read
        ))

        with m.FSM() as fsm:

            # IDLE state: waits for a transaction request
            with m.State('IDLE'):
                m.d.comb += self.idle        .eq(1)
                m.d.sync += self.phy.clk_en  .eq(0)

                # Once we have a transaction request, latch in our control
                # signals, and assert our chip-select.
                with m.If(self.start_transfer):
                    m.next = 'LATCH_RWDS'

                    m.d.sync += [
                        is_read             .eq(~self.perform_write),
                        is_register         .eq(self.register_space),
                        is_multipage        .eq(~self.single_page),
                        current_address     .eq(self.address),
                        self.phy.dq.o       .eq(0),
                    ]

                with m.Else():
                    m.d.sync += self.phy.cs.eq(0)


            # LATCH_RWDS -- latch in the value of the RWDS signal,
            # which determines our read/write latency.
            with m.State("LATCH_RWDS"):
                m.d.sync += extra_latency.eq(self.phy.rwds.i),
                m.d.sync += self.phy.clk_en.eq(0)
                m.next="SHIFT_COMMAND0"


            # SHIFT_COMMANDx -- shift each of our command words out
            with m.State('SHIFT_COMMAND0'):
                # Output the first 32 bits of our command.
                m.d.sync += [
                    self.phy.dq.o.eq(ca[16:48]),
                    self.phy.dq.e.eq(1)
                ]
                m.next = 'SHIFT_COMMAND1'

            with m.State('SHIFT_COMMAND1'):
                # Output the remaining 16 bits of our command.
                m.d.sync += [
                    self.phy.dq.o.eq(Cat(Const(0, 16), ca[0:16])),
                    self.phy.dq.e.eq(1)
                ]

                # If we have a register write, we don't need to handle
                # any latency. Move directly to our SHIFT_DATA state.
                with m.If(is_register & ~is_read):
                    m.next = 'WRITE_DATA'

                # Otherwise, react with either a short period of latency
                # or a longer one, depending on what the RAM requested via
                # RWDS.
                with m.Else():
                    m.next = "HANDLE_LATENCY"

                    # FIXME: our HyperRAM part has a fixed latency, but we could need to detect 
                    # different variants from the configuration register in the future.
                    with m.If(extra_latency | 1):
                        m.d.sync += latency_clocks_remaining.eq(self.HIGH_LATENCY_CLOCKS)
                    with m.Else():
                        m.d.sync += latency_clocks_remaining.eq(self.LOW_LATENCY_CLOCKS)


            # HANDLE_LATENCY -- applies clock cycles until our latency period is over.
            with m.State('HANDLE_LATENCY'):
                m.d.sync += latency_clocks_remaining.eq(latency_clocks_remaining - 1)

                with m.If(latency_clocks_remaining == 0):
                    with m.If(is_read):
                        m.next = 'READ_DATA'
                    with m.Else():
                        m.next = 'WRITE_DATA'


            # READ_DATA -- reads words from the PSRAM
            with m.State('READ_DATA'):

                # Store data sampled in last edge.
                m.d.sync += [
                    last_dq   .eq(self.phy.dq.i)
                ]

                # If RWDS has changed, the host has just sent us new data.
                # Sample it, and indicate that we now have a valid piece of new data.
                with m.Switch(self.phy.rwds.i):
                    with m.Case(0b1010):
                        m.d.comb += [
                            self.read_data     .eq(self.phy.dq.i),
                            self.read_ready    .eq(1),
                        ]

                        # If our controller is done with the transaction, end it.
                        with m.If(self.final_word):
                            m.next = 'RECOVERY'

                    with m.Case(0b0101):
                        m.next = 'READ_DATA_SHIFT1'

                    with m.Case(0b0010):
                        m.next = 'READ_DATA_SHIFT2'

                    with m.Case(0b0001):
                        m.next = 'READ_DATA_SHIFT3'

            with m.State('READ_DATA_SHIFT1'):
                m.d.sync += last_dq.eq(self.phy.dq.i)

                m.d.comb += [
                    self.read_data     .eq(Cat(self.phy.dq.i[24:32], last_dq[0:24])),
                    self.read_ready    .eq(1),
                ]

                # If our controller is done with the transaction, end it.
                with m.If(self.final_word):
                    m.next = 'RECOVERY'

            with m.State('READ_DATA_SHIFT2'):
                m.d.sync += last_dq.eq(self.phy.dq.i)

                m.d.comb += [
                    self.read_data     .eq(Cat(self.phy.dq.i[16:32], last_dq[0:16])),
                    self.read_ready    .eq(1),
                ]

                # If our controller is done with the transaction, end it.
                with m.If(self.final_word):
                    m.next = 'RECOVERY'

            with m.State('READ_DATA_SHIFT3'):
                m.d.sync += last_dq.eq(self.phy.dq.i)

                m.d.comb += [
                    self.read_data     .eq(Cat(self.phy.dq.i[8:32], last_dq[0:8])),
                    self.read_ready    .eq(1),
                ]

                # If our controller is done with the transaction, end it.
                with m.If(self.final_word):
                    m.next = 'RECOVERY'


            # WRITE_DATA -- write a word to the PSRAM
            with m.State("WRITE_DATA"):
                m.d.sync += [
                    self.phy.dq.o    .eq(self.write_data),
                    self.phy.dq.e    .eq(1),
                    self.phy.rwds.e  .eq(~is_register),
                    self.phy.rwds.o  .eq(0),
                ]
                m.d.comb += self.write_ready.eq(1),

                # If we just finished a register write, we're done -- there's no need for recovery.
                with m.If(is_register):
                    m.next = 'IDLE'

                with m.Elif(self.final_word):
                    m.next = 'RECOVERY'


            # RECOVERY state: wait for the required period of time before a new transaction
            with m.State('RECOVERY'):
                with m.If(~is_read):
                    # Data output enable needs to be held a bit longer
                    # otherwise the final byte isn't reliably output.
                    m.d.sync += self.phy.dq.e.eq(1)

                m.d.sync += [
                    self.phy.cs .eq(0),
                    self.phy.clk_en .eq(0),
                    last_dq    .eq(0),

                ]

                # TODO: implement recovery
                m.next = 'IDLE'



        return m


class TestHyperRAMInterface(LunaGatewareTestCase):

    def instantiate_dut(self):
        # Create a record that recreates the layout of our RAM signals.
        self.ram_signals = HyperBusPHY()

        # Create our HyperRAM interface...
        return HyperRAMInterface(phy=self.ram_signals)


    def assert_clock_pulses(self, times=1):
        """ Function that asserts we get a specified number of clock pulses. """

        for _ in range(times):
            yield
            self.assertEqual((yield self.ram_signals.clk_en), 0b11)


    @sync_test_case
    def test_register_write(self):

        # Before we transact, CS should be de-asserted, and RWDS and DQ should be undriven.
        yield
        self.assertEqual((yield self.ram_signals.cs),      0)
        self.assertEqual((yield self.ram_signals.dq.e),    0)
        self.assertEqual((yield self.ram_signals.rwds.e),  0)

        yield from self.advance_cycles(10)
        self.assertEqual((yield self.ram_signals.cs),      0)

        # Request a register write to ID register 0.
        yield self.dut.perform_write  .eq(1)
        yield self.dut.register_space .eq(1)
        yield self.dut.address        .eq(0x00BBCCDD)
        yield self.dut.start_transfer .eq(1)
        yield self.dut.final_word     .eq(1)
        yield self.dut.write_data     .eq(0xBEEF)

        # Simulate the RAM requesting a extended latency.
        yield self.ram_signals.rwds.i .eq(1)
        yield

        # Ensure that upon requesting, CS goes high, and our clock starts low.
        yield
        self.assertEqual((yield self.ram_signals.cs),     1)
        self.assertEqual((yield self.ram_signals.clk_en), 0)

        # Drop our "start request" line somewhere during the transaction;
        # so we don't immediately go into the next transfer.
        yield self.dut.start_transfer.eq(0)

        # We should then move to shifting out our first command word,
        # which means we're driving DQ with the first word of our command.
        yield
        yield
        self.assertEqual((yield self.ram_signals.cs),       1)
        self.assertEqual((yield self.ram_signals.clk_en),   0b11)
        self.assertEqual((yield self.ram_signals.dq.e),     1)
        self.assertEqual((yield self.ram_signals.dq.o),  0x6017799B)

        # This should continue until we've shifted out a full command.
        yield
        self.assertEqual((yield self.ram_signals.dq.o),  0x00050000)

        # Check that we've been driving our output this whole time,
        # and haven't been driving RWDS.
        self.assertEqual((yield self.ram_signals.dq.e),    1)
        self.assertEqual((yield self.ram_signals.rwds.e),  0)
        yield

        # For a _register_ write, there shouldn't be latency period.
        # This means we should continue driving DQ...
        self.assertEqual((yield self.ram_signals.dq.e),    1)
        self.assertEqual((yield self.ram_signals.rwds.e),  0)
        self.assertEqual((yield self.ram_signals.dq.o),  0xBEEF)



    @sync_test_case
    def test_register_read(self):

        # Before we transact, CS should be de-asserted, and RWDS and DQ should be undriven.
        yield
        self.assertEqual((yield self.ram_signals.cs),      0)
        self.assertEqual((yield self.ram_signals.dq.e),   0)
        self.assertEqual((yield self.ram_signals.rwds.e), 0)

        yield from self.advance_cycles(10)
        self.assertEqual((yield self.ram_signals.cs),      0)

        # Request a register read of ID register 0.
        yield self.dut.perform_write  .eq(0)
        yield self.dut.register_space .eq(1)
        yield self.dut.address        .eq(0x00BBCCDD)
        yield self.dut.start_transfer .eq(1)
        yield self.dut.final_word     .eq(1)

        # Simulate the RAM requesting a extended latency.
        yield self.ram_signals.rwds.i .eq(1)
        yield

        # Ensure that upon requesting, CS goes high, and our clock starts low.
        yield
        self.assertEqual((yield self.ram_signals.cs),     1)
        self.assertEqual((yield self.ram_signals.clk_en), 0)

        # Drop our "start request" line somewhere during the transaction;
        # so we don't immediately go into the next transfer.
        yield self.dut.start_transfer.eq(0)

        # We should then move to shifting out our first command word,
        # which means we're driving DQ with the first word of our command.
        yield
        yield
        self.assertEqual((yield self.ram_signals.cs),         1)
        self.assertEqual((yield self.ram_signals.clk_en),     0b11)
        self.assertEqual((yield self.ram_signals.dq.e),       1)
        self.assertEqual((yield self.ram_signals.dq.o),  0xe017799B)

        # This should continue until we've shifted out a full command.
        yield
        self.assertEqual((yield self.ram_signals.dq.o),  0x00050000)

        # Check that we've been driving our output this whole time,
        # and haven't been driving RWDS.
        self.assertEqual((yield self.ram_signals.dq.e),    1)
        self.assertEqual((yield self.ram_signals.rwds.e),  0)

        # Once we finish scanning out the word, we should stop driving
        # the data lines, and should finish two latency periods before
        # sending any more data.
        yield
        self.assertEqual((yield self.ram_signals.dq.e),    0)
        self.assertEqual((yield self.ram_signals.rwds.e),  0)
        self.assertEqual((yield self.ram_signals.clk_en),  0b11)

        # By this point, the RAM will drive RWDS low.
        yield self.ram_signals.rwds.i.eq(0)

        # Ensure the clock still ticking...
        yield
        self.assertEqual((yield self.ram_signals.clk_en),    0b11)

        # ... and remains so for the remainder of the latency period.
        yield from self.assert_clock_pulses(5)

        # Now, shift in a pair of data words.
        yield self.ram_signals.dq.i.eq(0xCAFEF00D)
        yield self.ram_signals.rwds.i.eq(0b1010)
        yield

        # Once this finished, we should have a result on our data out.
        self.assertEqual((yield self.dut.read_data),      0xCAFEF00D)
        self.assertEqual((yield self.dut.read_ready    ), 1)

        yield
        yield
        self.assertEqual((yield self.ram_signals.cs),     0)
        self.assertEqual((yield self.ram_signals.dq.e),   0)
        self.assertEqual((yield self.ram_signals.rwds.e), 0)

        # Ensure that our clock drops back to '0' during idle cycles.
        yield from self.advance_cycles(2)
        self.assertEqual((yield self.ram_signals.clk_en),  0)

        # TODO: test recovery time


class HyperRAMPHY(Elaboratable):
    """ Gateware interface to HyperRAM series self-refreshing DRAM chips.

    I/O port:
        B: bus              -- The primary physical connection to the DRAM chip.
    """

    def __init__(self, *, bus, in_skew=None, out_skew=None, clock_skew=None):
        self.bus = bus
        self.phy = HyperBusPHY()

    def elaborate(self, platform):
        m = Module()

        m.submodules += [
            FFSynchronizer(self.phy.rwds.e, self.bus.rwds.oe, stages=3),
            FFSynchronizer(self.phy.dq.e,   self.bus.dq.oe,   stages=3),
        ]

        # CS
        clk_out = Signal()
        m.submodules += [
            Instance("ODDRX2F",
                i_D0=~self.phy.cs,
                i_D1=~self.phy.cs,
                i_D2=~self.phy.cs,
                i_D3=~self.phy.cs,
                i_SCLK=ClockSignal(),
                i_ECLK=ClockSignal("fast"),
                i_RST=ResetSignal(),
                o_Q=self.bus.cs.io,
            ),
        ]

        # Clock
        clk_out = Signal()
        m.submodules += [
            Instance("ODDRX2F",
                i_D0=self.phy.clk_en[1],
                i_D1=0,
                i_D2=self.phy.clk_en[0],
                i_D3=0,
                i_SCLK=ClockSignal(),
                i_ECLK=ClockSignal("fast"),
                i_RST=ResetSignal(),
                o_Q=clk_out,
            ),
            Instance("DELAYF",
                i_A=clk_out,
                o_Z=self.bus.clk.o,
                # TODO: connect up move/load/dir
                p_DEL_VALUE=int(2e-9 / 25e-12),
            ),
        ]

        # RWDS out
        m.submodules += [
            Instance("ODDRX2F",
                i_D0=self.phy.rwds.o[3],
                i_D1=self.phy.rwds.o[2],
                i_D2=self.phy.rwds.o[1],
                i_D3=self.phy.rwds.o[0],
                i_SCLK=ClockSignal(),
                i_ECLK=ClockSignal("fast"),
                i_RST=ResetSignal(),
                o_Q=self.bus.rwds.o,
            ),
        ]

        # RWDS in
        rwds_in = Signal()
        m.submodules += [
            Instance("DELAYF",
                i_A=self.bus.rwds.i,
                o_Z=rwds_in,
                # TODO: connect up move/load/dir
                p_DEL_VALUE=int(0e-9 / 25e-12),
            ),
            Instance("IDDRX2F",
                i_D=rwds_in,
                i_SCLK=ClockSignal(),
                i_ECLK=ClockSignal("fast"),
                i_RST=ResetSignal(),
                o_Q0=self.phy.rwds.i[3],
                o_Q1=self.phy.rwds.i[2],
                o_Q2=self.phy.rwds.i[1],
                o_Q3=self.phy.rwds.i[0],
            ),
        ]

        # DQ
        for i in range(8):
            # Out
            m.submodules += [
                Instance("ODDRX2F",
                    i_D0=self.phy.dq.o[i+24],
                    i_D1=self.phy.dq.o[i+16],
                    i_D2=self.phy.dq.o[i+8],
                    i_D3=self.phy.dq.o[i],
                    i_SCLK=ClockSignal(),
                    i_ECLK=ClockSignal("fast"),
                    i_RST=ResetSignal(),
                    o_Q=self.bus.dq.o[i],
                ),
            ]

            # In
            dq_in = Signal(name=f"dq_in{i}")
            m.submodules += [
                Instance("DELAYF",
                    i_A=self.bus.dq.i[i],
                    o_Z=dq_in,
                    # TODO: connect up move/load/dir
                    p_DEL_VALUE=int(0e-9 / 25e-12),
                ),
                Instance("IDDRX2F",
                    i_D=dq_in,
                    i_SCLK=ClockSignal(),
                    i_ECLK=ClockSignal("fast"),
                    i_RST=ResetSignal(),
                    o_Q0=self.phy.dq.i[i+24],
                    o_Q1=self.phy.dq.i[i+16],
                    o_Q2=self.phy.dq.i[i+8],
                    o_Q3=self.phy.dq.i[i],
                ),
            ]

        return m

if __name__ == "__main__":
    unittest.main()

