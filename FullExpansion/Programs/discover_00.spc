RUNDEF discover_00
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

TABLE F0 AS FREQUENCY OF UPA.S2_P16
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_0.html" UTF8
TABLE F1 AS FREQUENCY OF UPA.S2_P17A
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_1.html" UTF8
TABLE F2 AS FREQUENCY OF UPA.S2_P17B
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_2.html" UTF8
TABLE F3 AS FREQUENCY OF UPA.S2_P18
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_3.html" UTF8
TABLE F4 AS FREQUENCY OF UPA.S3_P19
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_4.html" UTF8
TABLE F5 AS FREQUENCY OF UPA.S3_P20
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_5.html" UTF8
TABLE F6 AS FREQUENCY OF UPA.S3_P22_1
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_6.html" UTF8
TABLE F7 AS FREQUENCY OF UPA.S3_P22_2
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_7.html" UTF8
TABLE F8 AS FREQUENCY OF UPA.S3_P22_3
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_8.html" UTF8
TABLE F9 AS FREQUENCY OF UPA.S3_P22_4
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_9.html" UTF8
TABLE F10 AS FREQUENCY OF UPA.S16_P132
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_10.html" UTF8
TABLE F11 AS FREQUENCY OF UPA.S16_P133
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_11.html" UTF8
TABLE F12 AS FREQUENCY OF CULTIVOS.S4_P23
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_12.html" UTF8
TABLE F13 AS FREQUENCY OF CULTIVOS.S4_P24
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_13.html" UTF8
TABLE F14 AS FREQUENCY OF CULTIVOS.S4_P25
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_14.html" UTF8
TABLE F15 AS FREQUENCY OF CULTIVOS.S4_P26
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_15.html" UTF8
TABLE F16 AS FREQUENCY OF CULTIVOS.S4_P27
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_16.html" UTF8
TABLE F17 AS FREQUENCY OF CULTIVOS.S4_P28
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_17.html" UTF8
TABLE F18 AS FREQUENCY OF CULTIVOS.S4_P29
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_18.html" UTF8
TABLE F19 AS FREQUENCY OF CULTIVOS.S4_P30
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_19.html" UTF8
TABLE F20 AS FREQUENCY OF CULTINV.S4_P23_2
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_20.html" UTF8
TABLE F21 AS FREQUENCY OF CULTINV.S4_P23_4
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_21.html" UTF8
TABLE F22 AS FREQUENCY OF CULTINV.S4_P23_5
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_22.html" UTF8
TABLE F23 AS FREQUENCY OF CULTINV.S4_P23_7
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00_23.html" UTF8
DEFINE MUNIC.NUP AS COUNT UPA TYPE INTEGER
TABLE ENDLIST AS AREALIST OF MUNIC, MUNIC.NUP
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_00.csv" UTF8
