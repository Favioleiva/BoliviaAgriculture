RUNDEF discover_06
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

TABLE F0 AS FREQUENCY OF EQUIGAN.ULTIMO_ANIO
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_0.html" UTF8
TABLE F1 AS FREQUENCY OF BOSQMONT.S9_P91
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_1.html" UTF8
TABLE F2 AS FREQUENCY OF BOSQMONT.S9_P93_1
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_2.html" UTF8
TABLE F3 AS FREQUENCY OF BOSQMONT.S9_P93_2
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_3.html" UTF8
TABLE F4 AS FREQUENCY OF BOSQMONT.S9_P94
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_4.html" UTF8
TABLE F5 AS FREQUENCY OF BOSQMONT.S9_P95
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_5.html" UTF8
TABLE F6 AS FREQUENCY OF ESPMADER.COD92_1
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_6.html" UTF8
TABLE F7 AS FREQUENCY OF ESPNOMADER.S9_F96
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_7.html" UTF8
TABLE F8 AS FREQUENCY OF CAZAPEZCA.S10_P97
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_8.html" UTF8
TABLE F9 AS FREQUENCY OF CAZAPEZCA.S10_P99_1
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_9.html" UTF8
TABLE F10 AS FREQUENCY OF CAZAPEZCA.S10_P99_2
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_10.html" UTF8
TABLE F11 AS FREQUENCY OF CAZAPEZCA.S10_P100
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_11.html" UTF8
TABLE F12 AS FREQUENCY OF CAZAPEZCA.S10_P102_1
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_12.html" UTF8
TABLE F13 AS FREQUENCY OF CAZAPEZCA.S10_P102_2
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_13.html" UTF8
TABLE F14 AS FREQUENCY OF CAZAPEZCA.S10_P102_3
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_14.html" UTF8
TABLE F15 AS FREQUENCY OF CAZAPEZCA.S10_P103
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_15.html" UTF8
TABLE F16 AS FREQUENCY OF CAZAPEZCA.S10_P105_1
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_16.html" UTF8
TABLE F17 AS FREQUENCY OF CAZAPEZCA.S10_P105_2
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_17.html" UTF8
TABLE F18 AS FREQUENCY OF CAZAPEZCA.S10_P105_3
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_18.html" UTF8
TABLE F19 AS FREQUENCY OF ESPCAZA.S10_P98A
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_19.html" UTF8
TABLE F20 AS FREQUENCY OF ESPCAZA.S10_P98B
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_20.html" UTF8
TABLE F21 AS FREQUENCY OF ESPCAZA.S10_P98C
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_21.html" UTF8
TABLE F22 AS FREQUENCY OF ESPPESCA.S10_P101A
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_22.html" UTF8
TABLE F23 AS FREQUENCY OF ESPPESCA.S10_P101B
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06_23.html" UTF8
DEFINE MUNIC.NUP AS COUNT UPA TYPE INTEGER
TABLE ENDLIST AS AREALIST OF MUNIC, MUNIC.NUP
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_06.csv" UTF8
