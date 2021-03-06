EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Custom_Symbol:ESP32C3-12F U1
U 1 1 618B853B
P 1775 1525
F 0 "U1" H 1775 2392 50  0000 C CNN
F 1 "ESP32C3-12F" H 1775 2301 50  0000 C CNN
F 2 "Custom_Footprints:ESP8266" H 1175 250 50  0001 L BNN
F 3 "" H 1775 1525 50  0001 L BNN
F 4 "AI-Thinker" H 1625 1625 50  0001 L BNN "MANUFACTURER"
	1    1775 1525
	1    0    0    -1  
$EndComp
Wire Wire Line
	1075 925  950  925 
Wire Wire Line
	1075 1050 950  1050
Wire Wire Line
	1075 1175 950  1175
Wire Wire Line
	1075 1300 950  1300
Wire Wire Line
	1075 1425 950  1425
Wire Wire Line
	1075 1550 950  1550
Wire Wire Line
	1075 1675 950  1675
Wire Wire Line
	1075 1800 950  1800
Wire Wire Line
	1450 2325 1450 2525
Wire Wire Line
	1575 2325 1575 2525
Wire Wire Line
	1700 2325 1700 2525
Wire Wire Line
	1825 2325 1825 2525
Wire Wire Line
	1950 2325 1950 2525
Wire Wire Line
	2075 2325 2075 2525
Wire Wire Line
	2475 1800 2650 1800
Wire Wire Line
	2475 1675 2650 1675
Wire Wire Line
	2475 1550 2650 1550
Wire Wire Line
	2475 1425 2650 1425
Wire Wire Line
	2475 1300 2650 1300
Wire Wire Line
	2475 1175 2650 1175
Wire Wire Line
	2475 1050 2650 1050
Wire Wire Line
	2475 925  2650 925 
Text Label 950  925  2    50   ~ 0
IO0
Text Label 950  1050 2    50   ~ 0
IO1
Text Label 950  1175 2    50   ~ 0
CHIP_EN
Text Label 950  1300 2    50   ~ 0
IO2
Text Label 950  1425 2    50   ~ 0
IO3
Text Label 950  1550 2    50   ~ 0
IO4
Text Label 950  1675 2    50   ~ 0
IO5
Text Label 950  1800 2    50   ~ 0
ESP_VCC
NoConn ~ 1450 2525
NoConn ~ 1575 2525
NoConn ~ 1700 2525
Text Label 1825 2525 3    50   ~ 0
IO6
Text Label 1950 2525 3    50   ~ 0
IO7
$Comp
L power:GND #PWR01
U 1 1 618BCE3A
P 2650 1875
F 0 "#PWR01" H 2650 1625 50  0001 C CNN
F 1 "GND" H 2655 1702 50  0000 C CNN
F 2 "" H 2650 1875 50  0001 C CNN
F 3 "" H 2650 1875 50  0001 C CNN
	1    2650 1875
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 1875 2650 1800
NoConn ~ 2075 2525
Text Label 2650 1675 0    50   ~ 0
IO8
Text Label 2650 1550 0    50   ~ 0
IO10
Text Label 2650 1425 0    50   ~ 0
IO9
Text Label 2650 1300 0    50   ~ 0
IO18
Text Label 2650 1175 0    50   ~ 0
IO19
Text Label 2650 1050 0    50   ~ 0
RXD
Text Label 2650 925  0    50   ~ 0
TXD
$Comp
L Custom_Symbol:ME6211 IC1
U 1 1 618BF5A0
P 5800 1150
F 0 "IC1" H 5812 1565 50  0000 C CNN
F 1 "ME6211" H 5812 1474 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 5875 775 50  0001 C CNN
F 3 "" H 5750 1150 50  0001 C CNN
	1    5800 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 618C338D
P 5225 1250
F 0 "R4" V 5018 1250 50  0000 C CNN
F 1 "1M" V 5109 1250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5155 1250 50  0001 C CNN
F 3 "~" H 5225 1250 50  0001 C CNN
	1    5225 1250
	0    1    1    0   
$EndComp
$Comp
L Device:C C4
U 1 1 618C3CD3
P 4575 1175
F 0 "C4" H 4650 1275 50  0000 L CNN
F 1 "100nf" H 4600 1050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4613 1025 50  0001 C CNN
F 3 "~" H 4575 1175 50  0001 C CNN
	1    4575 1175
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C3
U 1 1 618C48E7
P 4350 1175
F 0 "C3" H 4375 1275 50  0000 L CNN
F 1 "1uF" H 4375 1050 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3216-18_Kemet-A" H 4388 1025 50  0001 C CNN
F 3 "~" H 4350 1175 50  0001 C CNN
	1    4350 1175
	1    0    0    -1  
$EndComp
Wire Wire Line
	4575 1025 4575 1000
Connection ~ 4575 1000
Wire Wire Line
	4575 1000 4350 1000
Wire Wire Line
	4350 1025 4350 1000
Connection ~ 4350 1000
Wire Wire Line
	4350 1000 4250 1000
Wire Wire Line
	5500 1125 4825 1125
Wire Wire Line
	4825 1125 4825 1425
Wire Wire Line
	4825 1425 4575 1425
Wire Wire Line
	4350 1425 4350 1325
Wire Wire Line
	4575 1325 4575 1425
Connection ~ 4575 1425
Wire Wire Line
	4575 1425 4350 1425
$Comp
L power:GND #PWR04
U 1 1 618C6CA5
P 4575 1550
F 0 "#PWR04" H 4575 1300 50  0001 C CNN
F 1 "GND" H 4580 1377 50  0000 C CNN
F 2 "" H 4575 1550 50  0001 C CNN
F 3 "" H 4575 1550 50  0001 C CNN
	1    4575 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4575 1550 4575 1425
Wire Wire Line
	5075 1250 4975 1250
Wire Wire Line
	5375 1250 5500 1250
NoConn ~ 6125 1250
$Comp
L Device:C C8
U 1 1 618C8F0F
P 6750 1175
F 0 "C8" H 6850 1275 50  0000 L CNN
F 1 "100nf" H 6865 1130 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6788 1025 50  0001 C CNN
F 3 "~" H 6750 1175 50  0001 C CNN
	1    6750 1175
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C7
U 1 1 618C8F15
P 6525 1175
F 0 "C7" H 6350 1275 50  0000 L CNN
F 1 "1uF" H 6575 1050 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-3216-18_Kemet-A" H 6563 1025 50  0001 C CNN
F 3 "~" H 6525 1175 50  0001 C CNN
	1    6525 1175
	1    0    0    -1  
$EndComp
Wire Wire Line
	6125 1000 6525 1000
Text HLabel 4250 1000 0    50   Input ~ 0
VIN
Text Label 7025 1000 0    50   ~ 0
ESP_VCC
Wire Wire Line
	6525 1025 6525 1000
Connection ~ 6525 1000
Wire Wire Line
	6525 1000 6750 1000
Wire Wire Line
	6750 1025 6750 1000
Connection ~ 6750 1000
Wire Wire Line
	6750 1000 7025 1000
Wire Wire Line
	6525 1325 6525 1425
Wire Wire Line
	6525 1425 4825 1425
Connection ~ 4825 1425
Wire Wire Line
	6750 1325 6750 1425
Wire Wire Line
	6750 1425 6525 1425
Connection ~ 6525 1425
Wire Wire Line
	4575 1000 5500 1000
Wire Wire Line
	4975 1250 4975 1550
Text HLabel 4975 1550 3    50   Input ~ 0
VCC_EN
$Comp
L Device:Q_NPN_BEC Q1
U 1 1 618D6D04
P 2325 3425
F 0 "Q1" H 2516 3471 50  0000 L CNN
F 1 "Q_NPN_BEC" H 2516 3380 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2525 3525 50  0001 C CNN
F 3 "~" H 2325 3425 50  0001 C CNN
	1    2325 3425
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BEC Q2
U 1 1 618D73D5
P 2325 4375
F 0 "Q2" H 2516 4329 50  0000 L CNN
F 1 "Q_NPN_BEC" H 2516 4420 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2525 4475 50  0001 C CNN
F 3 "~" H 2325 4375 50  0001 C CNN
	1    2325 4375
	1    0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 618D7A3F
P 1750 3425
F 0 "R1" V 1957 3425 50  0000 C CNN
F 1 "10K" V 1866 3425 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1680 3425 50  0001 C CNN
F 3 "~" H 1750 3425 50  0001 C CNN
	1    1750 3425
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 618D7E5E
P 1825 4375
F 0 "R2" V 2032 4375 50  0000 C CNN
F 1 "10K" V 1941 4375 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1755 4375 50  0001 C CNN
F 3 "~" H 1825 4375 50  0001 C CNN
	1    1825 4375
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1600 3425 1500 3425
Wire Wire Line
	1675 4375 1450 4375
Wire Wire Line
	2125 4375 1975 4375
Wire Wire Line
	2125 3425 1900 3425
Text Label 1225 3425 2    50   ~ 0
DTR
Text Label 1200 4375 2    50   ~ 0
RTS
Wire Wire Line
	2425 3625 2425 3825
Wire Wire Line
	2425 3825 1450 3825
Wire Wire Line
	1450 3825 1450 4375
Connection ~ 1450 4375
Wire Wire Line
	1450 4375 1200 4375
Wire Wire Line
	2425 4175 2425 3925
Wire Wire Line
	2425 3925 1500 3925
Wire Wire Line
	1500 3925 1500 3425
Connection ~ 1500 3425
Wire Wire Line
	1500 3425 1225 3425
Wire Wire Line
	2425 4575 2425 4700
Wire Wire Line
	2425 4700 3475 4700
Wire Wire Line
	2425 3225 2425 3175
Wire Wire Line
	2425 3175 3200 3175
Text Label 3500 3175 0    50   ~ 0
CHIP_EN
Text Label 3475 4700 0    50   ~ 0
IO9
$Comp
L Device:C C1
U 1 1 618E2FF0
P 3200 3450
F 0 "C1" H 3300 3550 50  0000 L CNN
F 1 "100nf" H 3315 3405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3238 3300 50  0001 C CNN
F 3 "~" H 3200 3450 50  0001 C CNN
	1    3200 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 618E366E
P 3200 3650
F 0 "#PWR02" H 3200 3400 50  0001 C CNN
F 1 "GND" H 3205 3477 50  0000 C CNN
F 2 "" H 3200 3650 50  0001 C CNN
F 3 "" H 3200 3650 50  0001 C CNN
	1    3200 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 3650 3200 3600
Wire Wire Line
	3200 3300 3200 3175
Connection ~ 3200 3175
Wire Wire Line
	3200 3175 3500 3175
$Comp
L Connector_Generic:Conn_01x06 J2
U 1 1 618E71D5
P 8075 3475
F 0 "J2" H 7993 2950 50  0000 C CNN
F 1 "Conn_01x06" H 7993 3041 50  0000 C CNN
F 2 "Connector_JST:JST_XH_B6B-XH-A_1x06_P2.50mm_Vertical" H 8075 3475 50  0001 C CNN
F 3 "~" H 8075 3475 50  0001 C CNN
	1    8075 3475
	-1   0    0    1   
$EndComp
Wire Wire Line
	8275 3175 8450 3175
Wire Wire Line
	8450 3175 8450 3075
Text Label 8450 3000 0    50   ~ 0
ESP_VCC
$Comp
L Device:C C9
U 1 1 618E990E
P 8700 3075
F 0 "C9" V 8500 3125 50  0000 L CNN
F 1 "100nf" V 8825 3150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8738 2925 50  0001 C CNN
F 3 "~" H 8700 3075 50  0001 C CNN
	1    8700 3075
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 618EAA6A
P 8950 3075
F 0 "#PWR07" H 8950 2825 50  0001 C CNN
F 1 "GND" V 8955 2947 50  0000 R CNN
F 2 "" H 8950 3075 50  0001 C CNN
F 3 "" H 8950 3075 50  0001 C CNN
	1    8950 3075
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8950 3075 8850 3075
Wire Wire Line
	8550 3075 8450 3075
Connection ~ 8450 3075
Wire Wire Line
	8450 3075 8450 3000
Wire Wire Line
	8275 3275 8600 3275
Wire Wire Line
	8275 3375 8600 3375
Text Label 8600 3375 0    50   ~ 0
TXD0
Wire Wire Line
	8275 3475 8600 3475
Wire Wire Line
	8275 3575 8600 3575
Wire Wire Line
	8275 3675 8450 3675
Wire Wire Line
	8450 3675 8450 3750
$Comp
L power:GND #PWR06
U 1 1 618F7D44
P 8450 3750
F 0 "#PWR06" H 8450 3500 50  0001 C CNN
F 1 "GND" H 8455 3577 50  0000 C CNN
F 2 "" H 8450 3750 50  0001 C CNN
F 3 "" H 8450 3750 50  0001 C CNN
	1    8450 3750
	1    0    0    -1  
$EndComp
Text Label 8600 3475 0    50   ~ 0
RXD0
Text Label 8600 3275 0    50   ~ 0
DTR
Text Label 8600 3575 0    50   ~ 0
RTS
$Comp
L Custom_Symbol:SW_Tactile S1
U 1 1 619059CC
P 5825 3550
F 0 "S1" H 5825 3799 50  0000 C CNN
F 1 "SW_Tactile" H 5825 3708 50  0000 C CNN
F 2 "Custom_Footprints:SW_Tactile" H 5825 3550 50  0001 L BNN
F 3 "" H 5825 3550 50  0001 L BNN
F 4 "SW_Tactile" H 5825 3550 50  0001 L BNN "Comment"
	1    5825 3550
	1    0    0    -1  
$EndComp
$Comp
L Custom_Symbol:SW_Tactile S2
U 1 1 61905EB7
P 5825 4150
F 0 "S2" H 5675 4225 50  0000 C CNN
F 1 "SW_Tactile" H 5825 4075 50  0000 C CNN
F 2 "Custom_Footprints:SW_Tactile" H 5825 4150 50  0001 L BNN
F 3 "" H 5825 4150 50  0001 L BNN
F 4 "SW_Tactile" H 5825 4150 50  0001 L BNN "Comment"
	1    5825 4150
	1    0    0    -1  
$EndComp
Text Label 5150 3550 2    50   ~ 0
CHIP_EN
Text Label 5175 4150 2    50   ~ 0
IO9
$Comp
L Device:C C5
U 1 1 61906AB2
P 5825 3750
F 0 "C5" V 5975 3700 50  0000 L CNN
F 1 "100nf" V 5700 3875 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5863 3600 50  0001 C CNN
F 3 "~" H 5825 3750 50  0001 C CNN
	1    5825 3750
	0    1    1    0   
$EndComp
$Comp
L Device:C C6
U 1 1 61907129
P 5825 4375
F 0 "C6" V 5975 4500 50  0000 L CNN
F 1 "100nf" V 5975 4200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5863 4225 50  0001 C CNN
F 3 "~" H 5825 4375 50  0001 C CNN
	1    5825 4375
	0    1    1    0   
$EndComp
Wire Wire Line
	5525 3550 5375 3550
Wire Wire Line
	5375 3550 5375 3750
Wire Wire Line
	5375 3750 5675 3750
Connection ~ 5375 3550
Wire Wire Line
	5375 3550 5150 3550
Wire Wire Line
	5975 3750 6400 3750
Wire Wire Line
	6400 3750 6400 3550
Wire Wire Line
	6400 3550 6125 3550
Wire Wire Line
	5175 4150 5375 4150
Wire Wire Line
	5675 4375 5375 4375
Wire Wire Line
	5375 4375 5375 4150
Connection ~ 5375 4150
Wire Wire Line
	5375 4150 5525 4150
Wire Wire Line
	6125 4150 6400 4150
Wire Wire Line
	6400 4150 6400 3750
Connection ~ 6400 3750
Wire Wire Line
	5975 4375 6400 4375
Wire Wire Line
	6400 4375 6400 4150
Connection ~ 6400 4150
Wire Wire Line
	6400 4375 6400 4500
Connection ~ 6400 4375
$Comp
L power:GND #PWR05
U 1 1 61920641
P 6400 4500
F 0 "#PWR05" H 6400 4250 50  0001 C CNN
F 1 "GND" H 6405 4327 50  0000 C CNN
F 2 "" H 6400 4500 50  0001 C CNN
F 3 "" H 6400 4500 50  0001 C CNN
	1    6400 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 61920F43
P 3450 1975
F 0 "C2" H 3525 2075 50  0000 L CNN
F 1 "100nf" H 3475 1850 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3488 1825 50  0001 C CNN
F 3 "~" H 3450 1975 50  0001 C CNN
	1    3450 1975
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 6192144D
P 3450 1350
F 0 "R3" H 3380 1304 50  0000 R CNN
F 1 "10K" H 3380 1395 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3380 1350 50  0001 C CNN
F 3 "~" H 3450 1350 50  0001 C CNN
	1    3450 1350
	-1   0    0    1   
$EndComp
Text Label 3450 1000 1    50   ~ 0
ESP_VCC
$Comp
L power:GND #PWR03
U 1 1 61921B8E
P 3450 2250
F 0 "#PWR03" H 3450 2000 50  0001 C CNN
F 1 "GND" H 3455 2077 50  0000 C CNN
F 2 "" H 3450 2250 50  0001 C CNN
F 3 "" H 3450 2250 50  0001 C CNN
	1    3450 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 2250 3450 2125
Wire Wire Line
	3450 1500 3450 1650
Wire Wire Line
	3450 1200 3450 1000
Wire Wire Line
	3450 1650 3575 1650
Connection ~ 3450 1650
Wire Wire Line
	3450 1650 3450 1825
Text Label 3575 1650 0    50   ~ 0
CHIP_EN
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J3
U 1 1 61935461
P 8500 4700
F 0 "J3" H 8550 5017 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 8550 4926 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 8500 4700 50  0001 C CNN
F 3 "~" H 8500 4700 50  0001 C CNN
	1    8500 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 619428FB
P 9075 4700
F 0 "R6" V 8975 4575 50  0000 C CNN
F 1 "0" V 9075 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9005 4700 50  0001 C CNN
F 3 "~" H 9075 4700 50  0001 C CNN
	1    9075 4700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R5
U 1 1 61943606
P 8000 4700
F 0 "R5" V 7900 4900 50  0000 C CNN
F 1 "0" V 8000 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7930 4700 50  0001 C CNN
F 3 "~" H 8000 4700 50  0001 C CNN
	1    8000 4700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8300 4700 8150 4700
Wire Wire Line
	8800 4700 8925 4700
Wire Wire Line
	7850 4700 7725 4700
Wire Wire Line
	9225 4700 9350 4700
Text Label 7725 4700 2    50   ~ 0
TXD
Text Label 9350 4700 0    50   ~ 0
RXD
Wire Wire Line
	8300 4800 8200 4800
Wire Wire Line
	8800 4800 8900 4800
Text Label 8900 4800 0    50   ~ 0
TXD0
Text Label 8200 4800 2    50   ~ 0
RXD0
Text HLabel 8125 4600 0    50   Input ~ 0
RXD1
Wire Wire Line
	8800 4600 8950 4600
Wire Wire Line
	8300 4600 8125 4600
Text HLabel 8950 4600 2    50   Input ~ 0
TXD1
$EndSCHEMATC
