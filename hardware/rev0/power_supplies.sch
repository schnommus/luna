EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 9
Title "LUNA: Power Supplies"
Date "2020-12-21"
Rev "r0"
Comp "Great Scott Gadgets"
Comment1 "Katherine J. Temkin"
Comment2 ""
Comment3 "Licensed under the CERN-OHL-P v2"
Comment4 ""
$EndDescr
$Comp
L fpgas_and_processors:ECP5-BGA256 IC1
U 1 1 5DA7C210
P 8350 3350
F 0 "IC1" H 9100 3518 50  0000 C CNN
F 1 "ECP5-BGA256" H 9100 3427 50  0000 C CNN
F 2 "luna:lattice_cabga256" H 5150 6800 50  0001 L CNN
F 3 "" H 4700 7750 50  0001 L CNN
F 4 "FPGA - Field Programmable Gate Array ECP5; 12k LUTs; 1.1V" H 4700 7650 50  0001 L CNN "Description"
F 5 "Lattice" H 4750 8600 50  0001 L CNN "Manufacturer"
F 6 "LFE5U-12F-6BG256C" H 4750 8500 50  0001 L CNN "Part Number"
	1    8350 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 3450 9850 3550
Wire Wire Line
	9850 6050 10300 6050
Wire Wire Line
	10300 6050 10300 6200
Connection ~ 9850 6050
Connection ~ 9850 3550
Wire Wire Line
	9850 3550 9850 3650
Connection ~ 9850 3650
Wire Wire Line
	9850 3650 9850 3750
Connection ~ 9850 3750
Wire Wire Line
	9850 3750 9850 3850
Connection ~ 9850 3850
Wire Wire Line
	9850 3850 9850 3950
Connection ~ 9850 3950
Wire Wire Line
	9850 3950 9850 4050
Connection ~ 9850 4050
Wire Wire Line
	9850 4050 9850 4150
Connection ~ 9850 4150
Wire Wire Line
	9850 4150 9850 4250
Connection ~ 9850 4250
Wire Wire Line
	9850 4250 9850 4350
Connection ~ 9850 4350
Wire Wire Line
	9850 4350 9850 4450
Connection ~ 9850 4450
Wire Wire Line
	9850 4450 9850 4550
Connection ~ 9850 4550
Wire Wire Line
	9850 4550 9850 4650
Connection ~ 9850 4650
Wire Wire Line
	9850 4650 9850 4750
Connection ~ 9850 4750
Wire Wire Line
	9850 4750 9850 4850
Connection ~ 9850 4850
Wire Wire Line
	9850 4850 9850 4950
Connection ~ 9850 4950
Wire Wire Line
	9850 4950 9850 5050
Connection ~ 9850 5050
Wire Wire Line
	9850 5050 9850 5150
Connection ~ 9850 5150
Wire Wire Line
	9850 5150 9850 5250
Connection ~ 9850 5250
Wire Wire Line
	9850 5250 9850 5350
Connection ~ 9850 5350
Wire Wire Line
	9850 5350 9850 5450
Connection ~ 9850 5450
Wire Wire Line
	9850 5450 9850 5550
Connection ~ 9850 5550
Wire Wire Line
	9850 5550 9850 5650
Connection ~ 9850 5650
Wire Wire Line
	9850 5650 9850 5750
Connection ~ 9850 5750
Wire Wire Line
	9850 5750 9850 5850
Connection ~ 9850 5850
Wire Wire Line
	9850 5850 9850 5950
Connection ~ 9850 5950
Wire Wire Line
	9850 5950 9850 6050
$Comp
L power:GND #PWR038
U 1 1 5DAB225F
P 10300 6200
F 0 "#PWR038" H 10300 5950 50  0001 C CNN
F 1 "GND" H 10305 6027 50  0000 C CNN
F 2 "" H 10300 6200 50  0001 C CNN
F 3 "" H 10300 6200 50  0001 C CNN
	1    10300 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 6050 8350 6000
Wire Wire Line
	8350 6000 8100 6000
Wire Wire Line
	8100 6000 8100 5800
Connection ~ 8350 6000
Wire Wire Line
	8350 6000 8350 5950
$Comp
L power:+2V5 #PWR037
U 1 1 5DAB4042
P 8100 5800
F 0 "#PWR037" H 8100 5650 50  0001 C CNN
F 1 "+2V5" H 8115 5973 50  0000 C CNN
F 2 "" H 8100 5800 50  0001 C CNN
F 3 "" H 8100 5800 50  0001 C CNN
	1    8100 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 3950 8350 3850
Connection ~ 8350 3550
Wire Wire Line
	8350 3550 8350 3450
Connection ~ 8350 3650
Wire Wire Line
	8350 3650 8350 3550
Connection ~ 8350 3750
Wire Wire Line
	8350 3750 8350 3700
Connection ~ 8350 3850
Wire Wire Line
	8350 3850 8350 3750
Wire Wire Line
	8350 3700 8050 3700
Wire Wire Line
	8050 3700 8050 3500
Connection ~ 8350 3700
Wire Wire Line
	8350 3700 8350 3650
$Comp
L power:+1V1 #PWR036
U 1 1 5DAB74FC
P 8050 3500
F 0 "#PWR036" H 8050 3350 50  0001 C CNN
F 1 "+1V1" H 8065 3673 50  0000 C CNN
F 2 "" H 8050 3500 50  0001 C CNN
F 3 "" H 8050 3500 50  0001 C CNN
	1    8050 3500
	1    0    0    -1  
$EndComp
Wire Notes Line
	500  3100 11200 3100
$Comp
L Device:C C7
U 1 1 5DB72418
P 1700 1000
F 0 "C7" H 1750 1100 50  0000 L CNN
F 1 "0.1uF" H 1700 900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1738 850 50  0001 C CNN
F 3 "~" H 1700 1000 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 1700 1000 50  0001 C CNN "Part Number"
	1    1700 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 5DB775B8
P 1900 1000
F 0 "C9" H 1950 1100 50  0000 L CNN
F 1 "0.1uF" H 1900 900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1938 850 50  0001 C CNN
F 3 "~" H 1900 1000 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 1900 1000 50  0001 C CNN "Part Number"
	1    1900 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 5DB78258
P 2100 1000
F 0 "C11" H 2150 1100 50  0000 L CNN
F 1 "0.1uF" H 2100 900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2138 850 50  0001 C CNN
F 3 "~" H 2100 1000 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 2100 1000 50  0001 C CNN "Part Number"
	1    2100 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 5DB78863
P 2300 1000
F 0 "C13" H 2350 1100 50  0000 L CNN
F 1 "0.1uF" H 2300 900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2338 850 50  0001 C CNN
F 3 "~" H 2300 1000 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 2300 1000 50  0001 C CNN "Part Number"
	1    2300 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C15
U 1 1 5DB78A7A
P 2500 1000
F 0 "C15" H 2550 1100 50  0000 L CNN
F 1 "0.1uF" H 2500 900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2538 850 50  0001 C CNN
F 3 "~" H 2500 1000 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 2500 1000 50  0001 C CNN "Part Number"
	1    2500 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C17
U 1 1 5DB79057
P 2700 1000
F 0 "C17" H 2750 1100 50  0000 L CNN
F 1 "0.1uF" H 2700 900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2738 850 50  0001 C CNN
F 3 "~" H 2700 1000 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 2700 1000 50  0001 C CNN "Part Number"
	1    2700 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5DB79E95
P 1050 1000
F 0 "C1" H 1100 1100 50  0000 L CNN
F 1 "2.2uF" H 800 900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1088 850 50  0001 C CNN
F 3 "~" H 1050 1000 50  0001 C CNN
F 4 "CAP CER 2.2UF 10V X5R 0603" H 1050 1000 50  0001 C CNN "Description"
F 5 "Samsung" H 1050 1000 50  0001 C CNN "Manufacturer"
F 6 "CL10A225KP8NNNC" H 1050 1000 50  0001 C CNN "Part Number"
	1    1050 1000
	1    0    0    -1  
$EndComp
$Comp
L power:+1V1 #PWR012
U 1 1 5DB7B3B9
P 850 850
F 0 "#PWR012" H 850 700 50  0001 C CNN
F 1 "+1V1" H 865 1023 50  0000 C CNN
F 2 "" H 850 850 50  0001 C CNN
F 3 "" H 850 850 50  0001 C CNN
	1    850  850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  850  1050 850 
Connection ~ 1050 850 
Wire Wire Line
	1050 850  1250 850 
Connection ~ 1700 850 
Wire Wire Line
	1700 850  1900 850 
Connection ~ 1900 850 
Wire Wire Line
	1900 850  2100 850 
Connection ~ 2100 850 
Wire Wire Line
	2100 850  2300 850 
Connection ~ 2300 850 
Wire Wire Line
	2300 850  2500 850 
Connection ~ 2500 850 
Wire Wire Line
	2500 850  2700 850 
Wire Wire Line
	2700 1150 2500 1150
Wire Wire Line
	850  1150 850  1200
Connection ~ 1050 1150
Wire Wire Line
	1050 1150 850  1150
Wire Wire Line
	1250 1150 1050 1150
Connection ~ 1700 1150
Connection ~ 1900 1150
Wire Wire Line
	1900 1150 1700 1150
Connection ~ 2100 1150
Wire Wire Line
	2100 1150 1900 1150
Connection ~ 2300 1150
Wire Wire Line
	2300 1150 2100 1150
Connection ~ 2500 1150
Wire Wire Line
	2500 1150 2300 1150
$Comp
L power:GND #PWR013
U 1 1 5DB84E04
P 850 1200
F 0 "#PWR013" H 850 950 50  0001 C CNN
F 1 "GND" H 855 1027 50  0000 C CNN
F 2 "" H 850 1200 50  0001 C CNN
F 3 "" H 850 1200 50  0001 C CNN
	1    850  1200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5DB795D8
P 1250 1000
F 0 "C3" H 1300 1100 50  0000 L CNN
F 1 "2.2uF" H 1250 900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1288 850 50  0001 C CNN
F 3 "~" H 1250 1000 50  0001 C CNN
F 4 "CAP CER 2.2UF 10V X5R 0603" H 1250 1000 50  0001 C CNN "Description"
F 5 "Samsung" H 1250 1000 50  0001 C CNN "Manufacturer"
F 6 "CL10A225KP8NNNC" H 1250 1000 50  0001 C CNN "Part Number"
	1    1250 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 850  1700 850 
Connection ~ 1250 850 
Wire Wire Line
	1250 1150 1700 1150
Connection ~ 1250 1150
Text Notes 1050 1300 0    39   ~ 0
2 bulk decoupling; 6 local for each individual pair of VCC/GND pins
$Comp
L power:+3V3 #PWR014
U 1 1 5DBBF959
P 850 1850
F 0 "#PWR014" H 850 1700 50  0001 C CNN
F 1 "+3V3" H 865 2023 50  0000 C CNN
F 2 "" H 850 1850 50  0001 C CNN
F 3 "" H 850 1850 50  0001 C CNN
	1    850  1850
	1    0    0    -1  
$EndComp
Text Notes 1050 2300 0    39   ~ 0
2 bulk decoupling; 6 local for the various 3V3 VCCIO pins\n(microcontroller / flash / etc decoupling is included locally)
Connection ~ 1250 2150
Wire Wire Line
	1250 2150 1700 2150
Connection ~ 1250 1850
Wire Wire Line
	1250 1850 1700 1850
$Comp
L Device:C C4
U 1 1 5DBA82F6
P 1250 2000
F 0 "C4" H 1300 2100 50  0000 L CNN
F 1 "2.2uF" H 1250 1900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1288 1850 50  0001 C CNN
F 3 "~" H 1250 2000 50  0001 C CNN
F 4 "CAP CER 2.2UF 10V X5R 0603" H 1250 2000 50  0001 C CNN "Description"
F 5 "Samsung" H 1250 2000 50  0001 C CNN "Manufacturer"
F 6 "CL10A225KP8NNNC" H 1250 2000 50  0001 C CNN "Part Number"
	1    1250 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5DBA82EC
P 850 2200
F 0 "#PWR015" H 850 1950 50  0001 C CNN
F 1 "GND" H 855 2027 50  0000 C CNN
F 2 "" H 850 2200 50  0001 C CNN
F 3 "" H 850 2200 50  0001 C CNN
	1    850  2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 2150 2300 2150
Connection ~ 2500 2150
Wire Wire Line
	2300 2150 2100 2150
Connection ~ 2300 2150
Wire Wire Line
	2100 2150 1900 2150
Connection ~ 2100 2150
Wire Wire Line
	1900 2150 1700 2150
Connection ~ 1900 2150
Connection ~ 1700 2150
Wire Wire Line
	1250 2150 1050 2150
Wire Wire Line
	1050 2150 850  2150
Connection ~ 1050 2150
Wire Wire Line
	850  2150 850  2200
Wire Wire Line
	2700 2150 2500 2150
Wire Wire Line
	2500 1850 2700 1850
Connection ~ 2500 1850
Wire Wire Line
	2300 1850 2500 1850
Connection ~ 2300 1850
Wire Wire Line
	2100 1850 2300 1850
Connection ~ 2100 1850
Wire Wire Line
	1900 1850 2100 1850
Connection ~ 1900 1850
Wire Wire Line
	1700 1850 1900 1850
Connection ~ 1700 1850
Wire Wire Line
	1050 1850 1250 1850
Connection ~ 1050 1850
Wire Wire Line
	850  1850 1050 1850
$Comp
L Device:C C2
U 1 1 5DBA82BD
P 1050 2000
F 0 "C2" H 1100 2100 50  0000 L CNN
F 1 "2.2uF" H 800 1900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1088 1850 50  0001 C CNN
F 3 "~" H 1050 2000 50  0001 C CNN
F 4 "CAP CER 2.2UF 10V X5R 0603" H 1050 2000 50  0001 C CNN "Description"
F 5 "Samsung" H 1050 2000 50  0001 C CNN "Manufacturer"
F 6 "CL10A225KP8NNNC" H 1050 2000 50  0001 C CNN "Part Number"
	1    1050 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C18
U 1 1 5DBA82B3
P 2700 2000
F 0 "C18" H 2750 2100 50  0000 L CNN
F 1 "0.1uF" H 2700 1900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2738 1850 50  0001 C CNN
F 3 "~" H 2700 2000 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 2700 2000 50  0001 C CNN "Part Number"
	1    2700 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C16
U 1 1 5DBA82A9
P 2500 2000
F 0 "C16" H 2550 2100 50  0000 L CNN
F 1 "0.1uF" H 2500 1900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2538 1850 50  0001 C CNN
F 3 "~" H 2500 2000 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 2500 2000 50  0001 C CNN "Part Number"
	1    2500 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 5DBA829F
P 2300 2000
F 0 "C14" H 2350 2100 50  0000 L CNN
F 1 "0.1uF" H 2300 1900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2338 1850 50  0001 C CNN
F 3 "~" H 2300 2000 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 2300 2000 50  0001 C CNN "Part Number"
	1    2300 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 5DBA8295
P 2100 2000
F 0 "C12" H 2150 2100 50  0000 L CNN
F 1 "0.1uF" H 2100 1900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2138 1850 50  0001 C CNN
F 3 "~" H 2100 2000 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 2100 2000 50  0001 C CNN "Part Number"
	1    2100 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 5DBA828B
P 1900 2000
F 0 "C10" H 1950 2100 50  0000 L CNN
F 1 "0.1uF" H 1900 1900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1938 1850 50  0001 C CNN
F 3 "~" H 1900 2000 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 1900 2000 50  0001 C CNN "Part Number"
	1    1900 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5DBA8281
P 1700 2000
F 0 "C8" H 1750 2100 50  0000 L CNN
F 1 "0.1uF" H 1700 1900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 1738 1850 50  0001 C CNN
F 3 "~" H 1700 2000 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 1700 2000 50  0001 C CNN "Part Number"
	1    1700 2000
	1    0    0    -1  
$EndComp
Text Notes 3850 1300 0    39   ~ 0
VCCAUX decoupling, only
$Comp
L power:GND #PWR027
U 1 1 5DBD058B
P 3650 1200
F 0 "#PWR027" H 3650 950 50  0001 C CNN
F 1 "GND" H 3655 1027 50  0000 C CNN
F 2 "" H 3650 1200 50  0001 C CNN
F 3 "" H 3650 1200 50  0001 C CNN
	1    3650 1200
	1    0    0    -1  
$EndComp
Connection ~ 4200 1150
Wire Wire Line
	3850 1150 3650 1150
Connection ~ 3850 1150
Wire Wire Line
	3650 1150 3650 1200
Connection ~ 4200 850 
Connection ~ 3850 850 
Wire Wire Line
	3650 850  3850 850 
$Comp
L Device:C C22
U 1 1 5DBD05B0
P 3850 1000
F 0 "C22" H 3900 1100 50  0000 L CNN
F 1 "1uF" H 3600 900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3888 850 50  0001 C CNN
F 3 "~" H 3850 1000 50  0001 C CNN
F 4 "GENERIC-CAP-0603-1uF" H 3850 1000 50  0001 C CNN "Part Number"
	1    3850 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C24
U 1 1 5DBD05EC
P 4200 1000
F 0 "C24" H 4250 1100 50  0000 L CNN
F 1 "0.1uF" H 4200 900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4238 850 50  0001 C CNN
F 3 "~" H 4200 1000 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 4200 1000 50  0001 C CNN "Part Number"
	1    4200 1000
	1    0    0    -1  
$EndComp
$Comp
L power:+2V5 #PWR026
U 1 1 5DBEB38D
P 3650 850
F 0 "#PWR026" H 3650 700 50  0001 C CNN
F 1 "+2V5" H 3665 1023 50  0000 C CNN
F 2 "" H 3650 850 50  0001 C CNN
F 3 "" H 3650 850 50  0001 C CNN
	1    3650 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 1150 4200 1150
Wire Wire Line
	4200 850  4400 850 
$Comp
L Device:C C26
U 1 1 5DBD05E2
P 4400 1000
F 0 "C26" H 4450 1100 50  0000 L CNN
F 1 "0.1uF" H 4400 900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4438 850 50  0001 C CNN
F 3 "~" H 4400 1000 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 4400 1000 50  0001 C CNN "Part Number"
	1    4400 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 1150 4200 1150
Wire Wire Line
	3850 850  4200 850 
Text Notes 650  2850 0    134  ~ 0
FPGA Decoupling
$Comp
L Device:R R?
U 1 1 6025B23B
P 7200 1400
AR Path="/6025B23B" Ref="R?"  Part="1" 
AR Path="/5DA7BAF4/6025B23B" Ref="R1"  Part="1" 
F 0 "R1" V 7150 1200 50  0000 C CNN
F 1 "2.2K" V 7200 1400 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 7130 1400 50  0001 C CNN
F 3 "~" H 7200 1400 50  0001 C CNN
F 4 "GENERIC-RES-0402-2.2K" H 7200 1400 50  0001 C CNN "Part Number"
	1    7200 1400
	0    -1   1    0   
$EndComp
$Comp
L support_hardware:AP22804-SOT U?
U 1 1 6025B245
P 7900 1150
AR Path="/6025B245" Ref="U?"  Part="1" 
AR Path="/5DA7BAF4/6025B245" Ref="U1"  Part="1" 
F 0 "U1" H 8150 1322 50  0000 C CNN
F 1 "AP22811" H 8150 1232 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 7900 1150 50  0001 C CNN
F 3 "" H 7900 1150 50  0001 C CNN
F 4 "IC PWR SWITCH P-CHAN 1:1 SOT25" H 7900 1150 50  0001 C CNN "Description"
F 5 "Diodes Inc." H 7900 1150 50  0001 C CNN "Manufacturer"
F 6 "AP22811AW5-7" H 7900 1150 50  0001 C CNN "Part Number"
	1    7900 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6025B251
P 6850 1300
AR Path="/6025B251" Ref="#PWR?"  Part="1" 
AR Path="/5DA7BAF4/6025B251" Ref="#PWR042"  Part="1" 
F 0 "#PWR042" H 6850 1050 50  0001 C CNN
F 1 "GND" V 6854 1172 50  0000 R CNN
F 2 "" H 6850 1300 50  0001 C CNN
F 3 "" H 6850 1300 50  0001 C CNN
	1    6850 1300
	0    1    1    0   
$EndComp
Wire Wire Line
	7350 1400 7500 1400
Connection ~ 7500 1400
Wire Wire Line
	7500 1400 7800 1400
$Comp
L Device:C C?
U 1 1 6025B27A
P 5950 1100
AR Path="/6025B27A" Ref="C?"  Part="1" 
AR Path="/5DA7BAF4/6025B27A" Ref="C54"  Part="1" 
F 0 "C54" H 6065 1145 50  0000 L CNN
F 1 "1uF" H 6065 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5988 950 50  0001 C CNN
F 3 "~" H 5950 1100 50  0001 C CNN
F 4 "GENERIC-CAP-0603-1uF" H 5950 1100 50  0001 C CNN "Part Number"
	1    5950 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6025B280
P 5950 1350
AR Path="/6025B280" Ref="#PWR?"  Part="1" 
AR Path="/5DA7BAF4/6025B280" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 5950 1100 50  0001 C CNN
F 1 "GND" H 5954 1178 50  0000 C CNN
F 2 "" H 5950 1350 50  0001 C CNN
F 3 "" H 5950 1350 50  0001 C CNN
	1    5950 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 1350 5950 1250
$Comp
L power:+5V #PWR?
U 1 1 6025B287
P 5950 750
AR Path="/6025B287" Ref="#PWR?"  Part="1" 
AR Path="/5DA7BAF4/6025B287" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 5950 600 50  0001 C CNN
F 1 "+5V" H 5964 923 50  0000 C CNN
F 2 "" H 5950 750 50  0001 C CNN
F 3 "" H 5950 750 50  0001 C CNN
	1    5950 750 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C40
U 1 1 6025B2A6
P 9150 1550
AR Path="/5DA7BAF4/6025B2A6" Ref="C40"  Part="1" 
AR Path="/6025B2A6" Ref="C?"  Part="1" 
F 0 "C40" H 9200 1650 50  0000 L CNN
F 1 "0.1uF" H 9150 1450 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9188 1400 50  0001 C CNN
F 3 "~" H 9150 1550 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 9150 1550 50  0001 C CNN "Part Number"
	1    9150 1550
	0    1    -1   0   
$EndComp
Wire Wire Line
	8900 1550 9000 1550
$Comp
L power:GND #PWR?
U 1 1 6025B2B4
P 9400 1550
AR Path="/6025B2B4" Ref="#PWR?"  Part="1" 
AR Path="/5DA7BAF4/6025B2B4" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 9400 1300 50  0001 C CNN
F 1 "GND" H 9500 1400 50  0000 R CNN
F 2 "" H 9400 1550 50  0001 C CNN
F 3 "" H 9400 1550 50  0001 C CNN
	1    9400 1550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9300 1550 9400 1550
Wire Wire Line
	6850 1300 6950 1300
Wire Wire Line
	7050 1400 6950 1400
Wire Wire Line
	6950 1400 6950 1300
Connection ~ 6950 1300
Wire Wire Line
	6950 1300 7800 1300
Wire Wire Line
	8900 1550 8900 1300
Wire Wire Line
	8500 1400 8800 1400
Wire Wire Line
	6900 1850 7800 1850
$Comp
L Device:R R?
U 1 1 6025B21B
P 7250 1950
AR Path="/6025B21B" Ref="R?"  Part="1" 
AR Path="/5DA7BAF4/6025B21B" Ref="R2"  Part="1" 
F 0 "R2" V 7350 1950 50  0000 C CNN
F 1 "2.2K" V 7250 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 7180 1950 50  0001 C CNN
F 3 "~" H 7250 1950 50  0001 C CNN
F 4 "GENERIC-RES-0402-2.2K" H 7250 1950 50  0001 C CNN "Part Number"
	1    7250 1950
	0    1    1    0   
$EndComp
$Comp
L support_hardware:AP22804-SOT U?
U 1 1 6025B224
P 7900 1700
AR Path="/6025B224" Ref="U?"  Part="1" 
AR Path="/5DA7BAF4/6025B224" Ref="U12"  Part="1" 
F 0 "U12" H 8150 1872 50  0000 C CNN
F 1 "AP22811" H 8150 1782 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 7900 1700 50  0001 C CNN
F 3 "" H 7900 1700 50  0001 C CNN
F 4 "IC PWR SWITCH P-CHAN 1:1 SOT25" H 7900 1700 50  0001 C CNN "Description"
F 5 "Diodes Inc." H 7900 1700 50  0001 C CNN "Manufacturer"
F 6 "AP22811AW5-7" H 7900 1700 50  0001 C CNN "Part Number"
	1    7900 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6025B22A
P 6900 1850
AR Path="/6025B22A" Ref="#PWR?"  Part="1" 
AR Path="/5DA7BAF4/6025B22A" Ref="#PWR083"  Part="1" 
F 0 "#PWR083" H 6900 1600 50  0001 C CNN
F 1 "GND" V 6904 1722 50  0000 R CNN
F 2 "" H 6900 1850 50  0001 C CNN
F 3 "" H 6900 1850 50  0001 C CNN
	1    6900 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	8500 1850 9750 1850
Wire Wire Line
	7800 1950 7600 1950
Connection ~ 7600 1950
Wire Wire Line
	7600 1950 7400 1950
$Comp
L Device:C C?
U 1 1 6025B26C
P 10350 2100
AR Path="/6025B26C" Ref="C?"  Part="1" 
AR Path="/5DA7BAF4/6025B26C" Ref="C53"  Part="1" 
F 0 "C53" V 10100 2100 50  0000 C CNN
F 1 "10uF" V 10190 2100 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10388 1950 50  0001 C CNN
F 3 "~" H 10350 2100 50  0001 C CNN
F 4 "CAP CER 10UF 10V X5R 0805" H 10350 2100 50  0001 C CNN "Description"
F 5 "Taiyo Yuden" H 10350 2100 50  0001 C CNN "Manufacturer"
F 6 "LMK212ABJ106KGHT" H 10350 2100 50  0001 C CNN "Part Number"
	1    10350 2100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6025B273
P 10350 2350
AR Path="/6025B273" Ref="#PWR?"  Part="1" 
AR Path="/5DA7BAF4/6025B273" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 10350 2100 50  0001 C CNN
F 1 "GND" H 10450 2200 50  0000 R CNN
F 2 "" H 10350 2350 50  0001 C CNN
F 3 "" H 10350 2350 50  0001 C CNN
	1    10350 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6025B297
P 6400 2250
AR Path="/6025B297" Ref="#PWR?"  Part="1" 
AR Path="/5DA7BAF4/6025B297" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 6400 2000 50  0001 C CNN
F 1 "GND" H 6404 2078 50  0000 C CNN
F 2 "" H 6400 2250 50  0001 C CNN
F 3 "" H 6400 2250 50  0001 C CNN
	1    6400 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 2250 6400 2150
Connection ~ 9750 1850
Wire Wire Line
	6300 1750 6400 1750
Wire Wire Line
	7000 1750 7800 1750
$Comp
L Device:C C?
U 1 1 6025B28F
P 6400 2000
AR Path="/6025B28F" Ref="C?"  Part="1" 
AR Path="/5DA7BAF4/6025B28F" Ref="C55"  Part="1" 
F 0 "C55" H 6515 2045 50  0000 L CNN
F 1 "1uF" H 6515 1955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6438 1850 50  0001 C CNN
F 3 "~" H 6400 2000 50  0001 C CNN
F 4 "GENERIC-CAP-0603-1uF" H 6400 2000 50  0001 C CNN "Part Number"
	1    6400 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604A4965
P 9900 2350
AR Path="/604A4965" Ref="#PWR?"  Part="1" 
AR Path="/5DA7BAF4/604A4965" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 9900 2100 50  0001 C CNN
F 1 "GND" H 9904 2178 50  0000 C CNN
F 2 "" H 9900 2350 50  0001 C CNN
F 3 "" H 9900 2350 50  0001 C CNN
	1    9900 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 2350 9900 2250
$Comp
L Device:C C?
U 1 1 604A496D
P 9900 2100
AR Path="/604A496D" Ref="C?"  Part="1" 
AR Path="/5DA7BAF4/604A496D" Ref="C45"  Part="1" 
F 0 "C45" H 10015 2145 50  0000 L CNN
F 1 "1uF" H 10015 2055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9938 1950 50  0001 C CNN
F 3 "~" H 9900 2100 50  0001 C CNN
F 4 "GENERIC-CAP-0603-1uF" H 9900 2100 50  0001 C CNN "Part Number"
	1    9900 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 2250 10350 2350
Wire Wire Line
	9750 1850 9900 1850
Wire Wire Line
	9900 1950 9900 1850
Connection ~ 9900 1850
Wire Wire Line
	9900 1850 10150 1850
Wire Wire Line
	10350 1950 10350 1850
Connection ~ 10350 1850
Wire Wire Line
	10350 1850 10450 1850
Wire Wire Line
	10150 1300 10150 1850
Connection ~ 10150 1850
Wire Wire Line
	10150 1850 10350 1850
Wire Wire Line
	6400 1850 6400 1750
Wire Wire Line
	7100 1950 7000 1950
Wire Wire Line
	7000 1750 7000 1950
Connection ~ 7000 1950
Connection ~ 7000 1750
Connection ~ 6400 1750
Wire Wire Line
	6400 1750 7000 1750
Wire Wire Line
	8500 1950 8700 1950
Text HLabel 6300 1750 0    50   BiDi ~ 0
TARGET_VBUS_C
Text HLabel 10450 1850 2    50   Output ~ 0
TARGET_VBUS_A
Wire Wire Line
	7600 1950 7600 1000
Wire Wire Line
	7500 1400 7500 1100
$Comp
L support_hardware:AP22804-SOT U?
U 1 1 602B24C1
P 8400 2550
AR Path="/602B24C1" Ref="U?"  Part="1" 
AR Path="/5DA7BAF4/602B24C1" Ref="U13"  Part="1" 
F 0 "U13" H 8650 2722 50  0000 C CNN
F 1 "AP22811" H 8650 2632 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 8400 2550 50  0001 C CNN
F 3 "" H 8400 2550 50  0001 C CNN
F 4 "IC PWR SWITCH P-CHAN 1:1 SOT25" H 8400 2550 50  0001 C CNN "Description"
F 5 "Diodes Inc." H 8400 2550 50  0001 C CNN "Manufacturer"
F 6 "AP22811AW5-7" H 8400 2550 50  0001 C CNN "Part Number"
	1    8400 2550
	-1   0    0    1   
$EndComp
Wire Wire Line
	9750 2500 8500 2500
Wire Wire Line
	7400 1000 7600 1000
$Comp
L power:GND #PWR?
U 1 1 60372EEF
P 9400 2400
AR Path="/60372EEF" Ref="#PWR?"  Part="1" 
AR Path="/5DA7BAF4/60372EEF" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 9400 2150 50  0001 C CNN
F 1 "GND" V 9404 2272 50  0000 R CNN
F 2 "" H 9400 2400 50  0001 C CNN
F 3 "" H 9400 2400 50  0001 C CNN
	1    9400 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9400 2400 9300 2400
Wire Wire Line
	9750 1850 9750 2500
$Comp
L Device:R R?
U 1 1 60584829
P 9050 2300
AR Path="/60584829" Ref="R?"  Part="1" 
AR Path="/5DA7BAF4/60584829" Ref="R42"  Part="1" 
F 0 "R42" V 9150 2300 50  0000 C CNN
F 1 "2.2K" V 9050 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 8980 2300 50  0001 C CNN
F 3 "~" H 9050 2300 50  0001 C CNN
F 4 "GENERIC-RES-0402-2.2K" H 9050 2300 50  0001 C CNN "Part Number"
	1    9050 2300
	0    1    -1   0   
$EndComp
Wire Wire Line
	9200 2300 9300 2300
Wire Wire Line
	9300 2300 9300 2400
Connection ~ 9300 2400
Wire Wire Line
	9300 2400 8500 2400
Wire Wire Line
	8500 2300 8600 2300
Connection ~ 8600 2300
Wire Wire Line
	8600 2300 8900 2300
Wire Wire Line
	7000 1950 7000 2400
Wire Wire Line
	7000 2400 7800 2400
Wire Wire Line
	7800 2300 7700 2300
Wire Wire Line
	7700 2300 7700 900 
Wire Wire Line
	7700 900  7400 900 
Text HLabel 7400 900  0    50   Output ~ 0
VBUS_C_TO_A_FAULT
Text HLabel 7400 1000 0    50   Input ~ 0
VBUS_A_TO_C_EN
Text HLabel 7400 1100 0    50   Input ~ 0
VBUS_5V_TO_A_EN
Wire Wire Line
	7400 1100 7500 1100
Text Notes 7100 2950 0    134  ~ 0
VBUS Load Switches
Text Notes 3850 4950 0    39   ~ 0
Operating the +1V1 rail at 1.15 V\nis a compromise between performance\nand power consumption. ECP5 core\nsupply voltage is specified as 1.1 V\nwhile the higher performing ECP5-5G\n(confirmed to be the same die) core\nsupply voltage is specified as 1.2 V.\n
$Comp
L Regulator_Linear:MIC5504-1.8YM5 U4
U 1 1 5FFE1C03
P 5350 4050
F 0 "U4" H 5350 4417 50  0000 C CNN
F 1 "TCR2EF115" H 5350 4326 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 5350 3650 50  0001 C CNN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=13794&prodName=TCR2EF115" H 5100 4300 50  0001 C CNN
F 4 "IC REG LINEAR 1.15V 200MA SMV" H 5350 4050 50  0001 C CNN "Description"
F 5 "Toshiba" H 5350 4050 50  0001 C CNN "Manufacturer"
F 6 "TCR2EF115,LM(CT" H 5350 4050 50  0001 C CNN "Part Number"
	1    5350 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5FEAA520
P 1250 3800
AR Path="/5FEAA520" Ref="C?"  Part="1" 
AR Path="/5DA7BAF4/5FEAA520" Ref="C6"  Part="1" 
F 0 "C6" V 1500 3800 50  0000 C CNN
F 1 "1uF" V 1400 3800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1288 3650 50  0001 C CNN
F 3 "~" H 1250 3800 50  0001 C CNN
F 4 "GENERIC-CAP-0603-1uF" H 1250 3800 50  0001 C CNN "Part Number"
	1    1250 3800
	0    1    -1   0   
$EndComp
Wire Wire Line
	2250 4500 2250 4600
Connection ~ 2250 4500
Wire Wire Line
	2950 4500 2250 4500
Wire Wire Line
	2250 4400 2250 4500
$Comp
L Regulator_Linear:MIC5504-1.8YM5 U3
U 1 1 5FE35315
P 2250 4100
F 0 "U3" H 2250 4467 50  0000 C CNN
F 1 "AP7366-33W5-7" H 2250 4376 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 2250 3700 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP7366.pdf" H 2000 4350 50  0001 C CNN
F 4 "Linear Voltage Regulator IC 1 Output 600mA SOT-25" H 2250 4100 50  0001 C CNN "Description"
F 5 "Diodes Inc." H 2250 4100 50  0001 C CNN "Manufacturer"
F 6 "AP7366-33W5-7" H 2250 4100 50  0001 C CNN "Part Number"
	1    2250 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 3800 1050 3900
Wire Wire Line
	1600 3700 1600 3800
Wire Wire Line
	1050 3800 1100 3800
Connection ~ 1600 3800
Wire Wire Line
	1600 3800 1600 4000
$Comp
L power:+5V #PWR019
U 1 1 5DB57CF1
P 1600 3700
F 0 "#PWR019" H 1600 3550 50  0001 C CNN
F 1 "+5V" H 1615 3873 50  0000 C CNN
F 2 "" H 1600 3700 50  0001 C CNN
F 3 "" H 1600 3700 50  0001 C CNN
	1    1600 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 3800 1600 3800
$Comp
L power:GND #PWR017
U 1 1 5DAFC997
P 1050 3900
F 0 "#PWR017" H 1050 3650 50  0001 C CNN
F 1 "GND" H 1055 3727 50  0000 C CNN
F 2 "" H 1050 3900 50  0001 C CNN
F 3 "" H 1050 3900 50  0001 C CNN
	1    1050 3900
	1    0    0    -1  
$EndComp
Connection ~ 1600 4000
Wire Wire Line
	6050 5950 6050 6150
Connection ~ 6050 5950
$Comp
L Connector:TestPoint TP5
U 1 1 5E218EBF
P 6050 5950
F 0 "TP5" V 6005 6137 50  0000 L CNN
F 1 "TestPoint" V 6095 6137 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 6250 5950 50  0001 C CNN
F 3 "~" H 6250 5950 50  0001 C CNN
	1    6050 5950
	0    1    1    0   
$EndComp
Wire Wire Line
	6050 3850 6050 3950
Connection ~ 6050 3850
$Comp
L Connector:TestPoint TP4
U 1 1 5E218B73
P 6050 3850
F 0 "TP4" V 6005 4037 50  0000 L CNN
F 1 "TestPoint" V 6095 4037 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 6250 3850 50  0001 C CNN
F 3 "~" H 6250 3850 50  0001 C CNN
	1    6050 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	3050 3850 3050 4000
Connection ~ 3050 3850
$Comp
L Connector:TestPoint TP3
U 1 1 5E218736
P 3050 3850
F 0 "TP3" V 3005 4037 50  0000 L CNN
F 1 "TestPoint" V 3095 4037 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 3250 3850 50  0001 C CNN
F 3 "~" H 3250 3850 50  0001 C CNN
	1    3050 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	4600 3750 4800 3750
Wire Wire Line
	4600 5950 4800 5950
Connection ~ 4800 6150
Wire Wire Line
	4800 6350 4950 6350
Wire Wire Line
	4800 6150 4800 6350
Wire Wire Line
	4800 4150 4950 4150
Connection ~ 4800 3950
Wire Wire Line
	4800 3950 4800 4150
Wire Wire Line
	1600 4200 1600 4000
Wire Wire Line
	1850 4200 1600 4200
Wire Wire Line
	2950 4500 2950 4300
Wire Wire Line
	2650 4000 2950 4000
Wire Wire Line
	2950 4000 3050 4000
Connection ~ 2950 4000
Wire Wire Line
	1600 4000 1850 4000
Wire Notes Line
	5250 3100 5250 500 
$Comp
L power:+1V1 #PWR034
U 1 1 5DB71356
P 6050 3600
F 0 "#PWR034" H 6050 3450 50  0001 C CNN
F 1 "+1V1" H 6065 3773 50  0000 C CNN
F 2 "" H 6050 3600 50  0001 C CNN
F 3 "" H 6050 3600 50  0001 C CNN
	1    6050 3600
	1    0    0    -1  
$EndComp
$Comp
L power:+2V5 #PWR030
U 1 1 5DB70700
P 4800 3650
F 0 "#PWR030" H 4800 3500 50  0001 C CNN
F 1 "+2V5" H 4815 3823 50  0000 C CNN
F 2 "" H 4800 3650 50  0001 C CNN
F 3 "" H 4800 3650 50  0001 C CNN
	1    4800 3650
	1    0    0    -1  
$EndComp
Wire Notes Line
	7000 3100 7000 6500
Wire Wire Line
	6050 3600 6050 3850
Text Notes 4650 5300 0    134  ~ 0
FPGA VCC CORE
Wire Wire Line
	5350 4400 5350 4450
Connection ~ 5350 4400
Wire Wire Line
	5900 4400 5350 4400
Wire Wire Line
	5900 4250 5900 4400
Wire Wire Line
	5900 3950 6050 3950
Connection ~ 5900 3950
$Comp
L Device:C C29
U 1 1 5DB5AC8D
P 5900 4100
F 0 "C29" H 6015 4146 50  0000 L CNN
F 1 "1uF" H 6015 4055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5938 3950 50  0001 C CNN
F 3 "~" H 5900 4100 50  0001 C CNN
F 4 "GENERIC-CAP-0603-1uF" H 5900 4100 50  0001 C CNN "Part Number"
	1    5900 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 3950 5900 3950
Wire Wire Line
	4800 3750 4800 3950
Connection ~ 4800 3750
$Comp
L power:GND #PWR028
U 1 1 5DB5AC7F
P 4250 3850
F 0 "#PWR028" H 4250 3600 50  0001 C CNN
F 1 "GND" H 4255 3677 50  0000 C CNN
F 2 "" H 4250 3850 50  0001 C CNN
F 3 "" H 4250 3850 50  0001 C CNN
	1    4250 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 3850 4250 3750
Wire Wire Line
	4250 3750 4300 3750
$Comp
L Device:C C27
U 1 1 5DB5AC73
P 4450 3750
F 0 "C27" V 4198 3750 50  0000 C CNN
F 1 "0.1uF" V 4289 3750 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4488 3600 50  0001 C CNN
F 3 "~" H 4450 3750 50  0001 C CNN
F 4 "GENERIC-CAP-0402-0.1uF" H 4450 3750 50  0001 C CNN "Part Number"
	1    4450 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	4800 3650 4800 3750
$Comp
L power:GND #PWR032
U 1 1 5DB5AC68
P 5350 4450
F 0 "#PWR032" H 5350 4200 50  0001 C CNN
F 1 "GND" H 5355 4277 50  0000 C CNN
F 2 "" H 5350 4450 50  0001 C CNN
F 3 "" H 5350 4450 50  0001 C CNN
	1    5350 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4350 5350 4400
Wire Wire Line
	4950 3950 4800 3950
$Comp
L power:+3V3 #PWR023
U 1 1 5DB58DE3
P 3050 3700
F 0 "#PWR023" H 3050 3550 50  0001 C CNN
F 1 "+3V3" H 3065 3873 50  0000 C CNN
F 2 "" H 3050 3700 50  0001 C CNN
F 3 "" H 3050 3700 50  0001 C CNN
	1    3050 3700
	1    0    0    -1  
$EndComp
Wire Notes Line
	3700 3100 3700 7750
Text Notes 1350 5250 0    134  ~ 0
Main I/O Supply
$Comp
L Device:C C20
U 1 1 5DAFC9B0
P 2950 4150
F 0 "C20" H 3065 4196 50  0000 L CNN
F 1 "2.2uF" H 3065 4105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2988 4000 50  0001 C CNN
F 3 "~" H 2950 4150 50  0001 C CNN
F 4 "CAP CER 2.2UF 10V X5R 0603" H 2950 4150 50  0001 C CNN "Description"
F 5 "Samsung" H 2950 4150 50  0001 C CNN "Manufacturer"
F 6 "CL10A225KP8NNNC" H 2950 4150 50  0001 C CNN "Part Number"
	1    2950 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 3700 3050 3850
$Comp
L power:GND #PWR021
U 1 1 5DAFC980
P 2250 4600
F 0 "#PWR021" H 2250 4350 50  0001 C CNN
F 1 "GND" H 2255 4427 50  0000 C CNN
F 2 "" H 2250 4600 50  0001 C CNN
F 3 "" H 2250 4600 50  0001 C CNN
	1    2250 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 5800 6050 5950
$Comp
L power:+2V5 #PWR035
U 1 1 5DAF4ABE
P 6050 5800
F 0 "#PWR035" H 6050 5650 50  0001 C CNN
F 1 "+2V5" H 6065 5973 50  0000 C CNN
F 2 "" H 6050 5800 50  0001 C CNN
F 3 "" H 6050 5800 50  0001 C CNN
	1    6050 5800
	1    0    0    -1  
$EndComp
Wire Notes Line
	3750 5400 7000 5400
Wire Notes Line
	3700 5400 500  5400
$Comp
L Regulator_Linear:MIC5504-2.5YM5 U5
U 1 1 5DAEA302
P 5350 6250
F 0 "U5" H 5350 6617 50  0000 C CNN
F 1 "MIC5504-2.5YM5" H 5350 6526 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 5350 5850 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/MIC550X.pdf" H 5100 6500 50  0001 C CNN
F 4 "IC REG LINEAR 2.5V 300MA SOT23-5" H 5350 6250 50  0001 C CNN "Description"
F 5 "Microchip" H 5350 6250 50  0001 C CNN "Manufacturer"
F 6 "MIC5504-2.5YM5-TR" H 5350 6250 50  0001 C CNN "Part Number"
	1    5350 6250
	1    0    0    -1  
$EndComp
Text Notes 4650 7550 0    134  ~ 0
FPGA VCCAUX
Wire Wire Line
	5350 6600 5350 6650
Connection ~ 5350 6600
Wire Wire Line
	5900 6600 5350 6600
Wire Wire Line
	5900 6450 5900 6600
Wire Wire Line
	5900 6150 6050 6150
Connection ~ 5900 6150
$Comp
L Device:C C30
U 1 1 5DAE1BF3
P 5900 6300
F 0 "C30" H 6015 6346 50  0000 L CNN
F 1 "1uF" H 6015 6255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5938 6150 50  0001 C CNN
F 3 "~" H 5900 6300 50  0001 C CNN
F 4 "GENERIC-CAP-0603-1uF" H 5900 6300 50  0001 C CNN "Part Number"
	1    5900 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 6150 5900 6150
Wire Wire Line
	4800 5950 4800 6150
Connection ~ 4800 5950
$Comp
L power:GND #PWR029
U 1 1 5DAE1BDA
P 4250 6050
F 0 "#PWR029" H 4250 5800 50  0001 C CNN
F 1 "GND" H 4255 5877 50  0000 C CNN
F 2 "" H 4250 6050 50  0001 C CNN
F 3 "" H 4250 6050 50  0001 C CNN
	1    4250 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 6050 4250 5950
Wire Wire Line
	4250 5950 4300 5950
$Comp
L Device:C C28
U 1 1 5DAE1BCE
P 4450 5950
F 0 "C28" V 4198 5950 50  0000 C CNN
F 1 "1uF" V 4289 5950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4488 5800 50  0001 C CNN
F 3 "~" H 4450 5950 50  0001 C CNN
F 4 "GENERIC-CAP-0603-1uF" H 4450 5950 50  0001 C CNN "Part Number"
	1    4450 5950
	0    1    1    0   
$EndComp
Wire Wire Line
	4800 5850 4800 5950
$Comp
L power:GND #PWR033
U 1 1 5DAE1BC3
P 5350 6650
F 0 "#PWR033" H 5350 6400 50  0001 C CNN
F 1 "GND" H 5355 6477 50  0000 C CNN
F 2 "" H 5350 6650 50  0001 C CNN
F 3 "" H 5350 6650 50  0001 C CNN
	1    5350 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 6550 5350 6600
$Comp
L power:+3V3 #PWR031
U 1 1 5DAE1BB6
P 4800 5850
F 0 "#PWR031" H 4800 5700 50  0001 C CNN
F 1 "+3V3" H 4815 6023 50  0000 C CNN
F 2 "" H 4800 5850 50  0001 C CNN
F 3 "" H 4800 5850 50  0001 C CNN
	1    4800 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 6150 4800 6150
Wire Wire Line
	8500 1300 8900 1300
Connection ~ 8900 1300
Wire Wire Line
	8900 1300 10150 1300
Wire Wire Line
	8800 1200 8900 1200
Wire Wire Line
	8800 1400 8800 1200
Text HLabel 8900 1200 2    50   Output ~ 0
VBUS_5V_TO_A_FAULT
Wire Wire Line
	8700 1100 8900 1100
Wire Wire Line
	8700 1950 8700 1100
Text HLabel 8900 1100 2    50   Output ~ 0
VBUS_A_TO_C_FAULT
Text HLabel 8900 1000 2    50   Input ~ 0
VBUS_C_TO_A_EN
Wire Wire Line
	8600 1000 8900 1000
Wire Wire Line
	8600 2300 8600 1000
Wire Wire Line
	9250 800  9200 800 
$Comp
L power:+3V3 #PWR?
U 1 1 60C90AE9
P 9250 800
AR Path="/60C90AE9" Ref="#PWR?"  Part="1" 
AR Path="/5DA7BAF4/60C90AE9" Ref="#PWR0100"  Part="1" 
F 0 "#PWR0100" H 9250 650 50  0001 C CNN
F 1 "+3V3" V 9264 928 50  0000 L CNN
F 2 "" H 9250 800 50  0001 C CNN
F 3 "" H 9250 800 50  0001 C CNN
	1    9250 800 
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60C90AE3
P 9050 800
AR Path="/60C90AE3" Ref="R?"  Part="1" 
AR Path="/5DA7BAF4/60C90AE3" Ref="R3"  Part="1" 
F 0 "R3" V 9150 800 50  0000 C CNN
F 1 "10K" V 9050 800 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 8980 800 50  0001 C CNN
F 3 "~" H 9050 800 50  0001 C CNN
F 4 "GENERIC-RES-0402-10K" H 9050 800 50  0001 C CNN "Part Number"
	1    9050 800 
	0    1    1    0   
$EndComp
Wire Wire Line
	9250 600  9200 600 
$Comp
L power:+3V3 #PWR?
U 1 1 60E90328
P 9250 600
AR Path="/60E90328" Ref="#PWR?"  Part="1" 
AR Path="/5DA7BAF4/60E90328" Ref="#PWR099"  Part="1" 
F 0 "#PWR099" H 9250 450 50  0001 C CNN
F 1 "+3V3" V 9264 728 50  0000 L CNN
F 2 "" H 9250 600 50  0001 C CNN
F 3 "" H 9250 600 50  0001 C CNN
	1    9250 600 
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60E90333
P 9050 600
AR Path="/60E90333" Ref="R?"  Part="1" 
AR Path="/5DA7BAF4/60E90333" Ref="R41"  Part="1" 
F 0 "R41" V 9150 600 50  0000 C CNN
F 1 "10K" V 9050 600 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 8980 600 50  0001 C CNN
F 3 "~" H 9050 600 50  0001 C CNN
F 4 "GENERIC-RES-0402-10K" H 9050 600 50  0001 C CNN "Part Number"
	1    9050 600 
	0    1    1    0   
$EndComp
Wire Wire Line
	8800 1200 8800 800 
Wire Wire Line
	8800 800  8900 800 
Connection ~ 8800 1200
Wire Wire Line
	8700 1100 8700 600 
Wire Wire Line
	8700 600  8900 600 
Connection ~ 8700 1100
Wire Wire Line
	7050 700  7100 700 
$Comp
L power:+3V3 #PWR?
U 1 1 60EC101A
P 7050 700
AR Path="/60EC101A" Ref="#PWR?"  Part="1" 
AR Path="/5DA7BAF4/60EC101A" Ref="#PWR082"  Part="1" 
F 0 "#PWR082" H 7050 550 50  0001 C CNN
F 1 "+3V3" V 7064 828 50  0000 L CNN
F 2 "" H 7050 700 50  0001 C CNN
F 3 "" H 7050 700 50  0001 C CNN
	1    7050 700 
	0    -1   1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60EC1025
P 7250 700
AR Path="/60EC1025" Ref="R?"  Part="1" 
AR Path="/5DA7BAF4/60EC1025" Ref="R40"  Part="1" 
F 0 "R40" V 7350 700 50  0000 C CNN
F 1 "10K" V 7250 700 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 7180 700 50  0001 C CNN
F 3 "~" H 7250 700 50  0001 C CNN
F 4 "GENERIC-RES-0402-10K" H 7250 700 50  0001 C CNN "Part Number"
	1    7250 700 
	0    -1   1    0   
$EndComp
Wire Wire Line
	7700 700  7400 700 
Wire Wire Line
	7700 700  7700 900 
Connection ~ 7700 900 
Wire Wire Line
	5950 750  5950 850 
Wire Wire Line
	5950 850  6400 850 
Wire Wire Line
	6400 850  6400 1200
Wire Wire Line
	6400 1200 7800 1200
Connection ~ 5950 850 
Wire Wire Line
	5950 850  5950 950 
$EndSCHEMATC
