#!/usr/bin/env python3
#
# This file is part of LUNA.
#
# Copyright (c) 2020 Great Scott Gadgets <info@greatscottgadgets.com>
# SPDX-License-Identifier: BSD-3-Clause

import operator
from functools import reduce

from amaranth import Signal, Elaboratable, Module, Cat, ClockDomain, ClockSignal, ResetSignal
from amaranth.lib.cdc import FFSynchronizer

from luna                             import top_level_cli
from luna.gateware.utils.cdc          import synchronize
from luna.gateware.architecture.car   import LunaECP5DomainGenerator
from luna.gateware.interface.jtag     import JTAGRegisterInterface
from luna.gateware.interface.ulpi     import ULPIRegisterWindow
from luna.gateware.interface.psram    import HyperRAMGenericPHY, HyperRAMGenericInterface

from apollo_fpga.support.selftest          import ApolloSelfTestCase, named_test


CLOCK_FREQUENCIES = {
    "fast": 120,
    "sync": 60,
    "usb":  60
}



# Store the IDs for Cypress and Winbond HyperRAMs.
ALLOWED_HYPERRAM_IDS = (0x0c81, 0x0c86)


REGISTER_ID             = 1
REGISTER_LEDS           = 2

REGISTER_TARGET_ADDR    = 7
REGISTER_TARGET_VALUE   = 8
REGISTER_TARGET_RXCMD   = 9

REGISTER_AUX_ADDR      = 10
REGISTER_AUX_VALUE     = 11
REGISTER_AUX_RXCMD     = 12

REGISTER_CONTROL_ADDR  = 13
REGISTER_CONTROL_VALUE = 14
REGISTER_CONTROL_RXCMD = 15

REGISTER_RAM_REG_ADDR   = 20
REGISTER_RAM_VALUE      = 21

class InteractiveSelftest(Elaboratable, ApolloSelfTestCase):
    """ Hardware meant to demonstrate use of the Debug Controller's register interface.

    Registers:
        0 -- register/address size auto-negotiation for Apollo

        1 -- gateware ID register (TEST)
        2 -- fpga LEDs

        7 -- target PHY ULPI register address
        8 -- target PHY ULPI register value
        9 -- last target PHY RxCmd

        10 -- host PHY ULPI register address
        11 -- host PHY ULPI register value
        12 -- last host PHY RxCmd

        13 -- sideband PHY ULPI register address
        14 -- sideband PHY ULPI register value
        15 -- last sideband PHY RxCmd

        20 -- HyperRAM register address
        21 -- HyperRAM register value
    """

    def elaborate(self, platform):
        m = Module()

        # Generate our clock domains.
        clocking = LunaECP5DomainGenerator(clock_frequencies=CLOCK_FREQUENCIES)
        m.submodules.clocking = clocking

        registers = JTAGRegisterInterface(default_read_value=0xDEADBEEF)
        m.submodules.registers = registers

        # Simple applet ID register.
        registers.add_read_only_register(REGISTER_ID, read=0x54455354)

        # LED test register.
        led_reg = registers.add_register(REGISTER_LEDS, size=6, name="leds", reset=0b111111)
        led_out   = Cat([platform.request("led", i, dir="o").o for i in range(0, 6)])
        m.d.comb += led_out.eq(led_reg)

        #
        # ULPI PHY windows
        #
        self.add_ulpi_registers(m, platform,
            ulpi_bus="target_phy",
            register_base=REGISTER_TARGET_ADDR
        )
        self.add_ulpi_registers(m, platform,
            ulpi_bus="aux_phy",
            register_base=REGISTER_AUX_ADDR
        )
        self.add_ulpi_registers(m, platform,
            ulpi_bus="control_phy",
            register_base=REGISTER_CONTROL_ADDR
        )


        #
        # HyperRAM test connections.
        #
        ram_bus = platform.request('ram', dir={'cs': '-'})
        psram_phy = HyperRAMGenericPHY(bus=ram_bus)
        psram = HyperRAMGenericInterface(phy=psram_phy.phy)
        m.submodules += [psram_phy, psram]

        psram_address_changed = Signal()
        psram_address = registers.add_register(REGISTER_RAM_REG_ADDR, write_strobe=psram_address_changed)

        # Store last read word from HyperRAM.
        psram_read_data = Signal.like(psram.read_data)
        with m.If(psram.read_ready):
            m.d.sync += psram_read_data.eq(psram.read_data)
        registers.add_sfr(REGISTER_RAM_VALUE, read=psram_read_data)

        # Hook up our PSRAM.
        m.d.comb += [
            ram_bus.reset.o        .eq(0),
            psram.single_page      .eq(0),
            psram.perform_write    .eq(0),
            psram.register_space   .eq(1),
            psram.final_word       .eq(1),
            psram.start_transfer   .eq(psram_address_changed),
            psram.address          .eq(psram_address),
        ]

        return m


    def add_ulpi_registers(self, m, platform, *, ulpi_bus, register_base):
        """ Adds a set of ULPI registers to the active design. """

        target_ulpi      = platform.request(ulpi_bus)

        ulpi_reg_window  = ULPIRegisterWindow()
        m.submodules  += ulpi_reg_window

        m.d.comb += [
            ulpi_reg_window.ulpi_data_in  .eq(target_ulpi.data.i),
            ulpi_reg_window.ulpi_dir      .eq(target_ulpi.dir.i),
            ulpi_reg_window.ulpi_next     .eq(target_ulpi.nxt.i),

            target_ulpi.clk.o    .eq(ClockSignal("usb")),
            target_ulpi.rst.o    .eq(ResetSignal("usb")),
            target_ulpi.stp.o    .eq(ulpi_reg_window.ulpi_stop),
            target_ulpi.data.o   .eq(ulpi_reg_window.ulpi_data_out),
            target_ulpi.data.oe  .eq(~target_ulpi.dir.i)
        ]

        register_address_change  = Signal()
        register_value_change    = Signal()

        # ULPI register address.
        registers = m.submodules.registers
        registers.add_register(register_base + 0,
            write_strobe=register_address_change,
            value_signal=ulpi_reg_window.address,
            size=6
        )
        m.submodules.clocking.stretch_sync_strobe_to_usb(m,
            strobe=register_address_change,
            output=ulpi_reg_window.read_request,
        )

        # ULPI register value.
        registers.add_sfr(register_base + 1,
            read=ulpi_reg_window.read_data,
            write_signal=ulpi_reg_window.write_data,
            write_strobe=register_value_change
        )
        m.submodules.clocking.stretch_sync_strobe_to_usb(m,
            strobe=register_value_change,
            output=ulpi_reg_window.write_request
        )


    def assertPhyRegister(self, phy_register_base: int, register: int, expected_value: int):
        """ Asserts that a PHY register contains a given value.

        Parameters:
            phy_register_base -- The base address of the PHY window in the debug SPI
                                 address range.
            register          -- The PHY register to check.
            value             -- The expected value of the relevant PHY register.
        """

        # Set the address of the ULPI register we're going to read from.
        self.dut.registers.register_write(phy_register_base, register)
        self.dut.registers.register_write(phy_register_base, register)

        # ... and read back its value.
        actual_value = self.dut.registers.register_read(phy_register_base + 1)

        # Finally, validate it.
        if actual_value != expected_value:
            raise AssertionError(f"PHY register {register} was {actual_value}, not expected {expected_value}")


    def assertPhyReadBack(self, phy_register_base: int, value: int):
        """ Writes a value to the PHY scratch register and asserts that the read-back matches.

        Parameters:
            phy_register_base -- The base address of the PHY window in the debug SPI
                                 address range.
            value             -- The value written to the scratch register.
        """

        # Set the address of the ULPI register we're going to read from.
        self.dut.registers.register_write(phy_register_base, 0x16)

        # Write the value to it.
        self.dut.registers.register_write(phy_register_base + 1, value)

        # Set the address again to perform the read.
        self.dut.registers.register_write(phy_register_base, 0x16)

        # ... and read back the value.
        actual_value = self.dut.registers.register_read(phy_register_base + 1)

        # Finally, validate it.
        if actual_value != value:
            raise AssertionError(f"PHY scratch register read-back was {actual_value}, not expected {value}")


    def assertPhyPresence(self, register_base: int):
        """ Assertion that fails iff the given PHY isn't detected. """

        # Check the value of our four ID registers, which should
        # read 2404:0900 (vendor: microchip; product: USB3343).
        self.assertPhyRegister(register_base, 0, 0x24)
        self.assertPhyRegister(register_base, 1, 0x04)
        self.assertPhyRegister(register_base, 2, 0x09)
        self.assertPhyRegister(register_base, 3, 0x00)

        # Write some patterns to the scratch register & read them back
        # to exercise all the DATA# lines.
        self.assertPhyReadBack(register_base, 0x00)
        self.assertPhyReadBack(register_base, 0xff)
        for i in range(8):
            self.assertPhyReadBack(register_base, (1 << i))


    def assertHyperRAMRegister(self, address: int, expected_values: int):
        """ Assertion that fails iff a RAM register doesn't hold the expected value. """

        self.dut.registers.register_write(REGISTER_RAM_REG_ADDR, address)
        actual_value =  self.dut.registers.register_read(REGISTER_RAM_VALUE) >> 16

        if actual_value not in expected_values:
            raise AssertionError(f"RAM register {address} was {actual_value}, not one of expected {expected_values}")


    @named_test("Debug module")
    def test_debug_connection(self, dut):
        self.assertRegisterValue(1, 0x54455354)


    @named_test("AUX PHY")
    def test_host_phy(self, dut):
        self.assertPhyPresence(REGISTER_AUX_ADDR)


    @named_test("TARGET PHY")
    def test_target_phy(self, dut):
        self.assertPhyPresence(REGISTER_TARGET_ADDR)


    @named_test("CONTROL PHY")
    def test_sideband_phy(self, dut):
        self.assertPhyPresence(REGISTER_CONTROL_ADDR)


    @named_test("HyperRAM")
    def test_hyperram(self, dut):
        self.assertHyperRAMRegister(0, ALLOWED_HYPERRAM_IDS)



if __name__ == "__main__":
    tester = top_level_cli(InteractiveSelftest)

    if tester:
        tester.run_tests()

    print()
