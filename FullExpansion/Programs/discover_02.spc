RUNDEF discover_02
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

TABLE F0 AS FREQUENCY OF PRACAGRI.S5_P35
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_0.html" UTF8
TABLE F1 AS FREQUENCY OF PRACAGRI.S5_P36
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_1.html" UTF8
TABLE F2 AS FREQUENCY OF PRACAGRI.S5_P37
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_2.html" UTF8
TABLE F3 AS FREQUENCY OF CULTORG.S5_P37_1A
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_3.html" UTF8
TABLE F4 AS FREQUENCY OF CULTORG.S5_P37_1B
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_4.html" UTF8
TABLE F5 AS FREQUENCY OF MAQAGRI.S5_P39A
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_5.html" UTF8
TABLE F6 AS FREQUENCY OF MAQAGRI.S5_P39C
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_6.html" UTF8
TABLE F7 AS FREQUENCY OF MAQAGRI.S5_P39D
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_7.html" UTF8
TABLE F8 AS FREQUENCY OF INFRAGRI.S5_38
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_8.html" UTF8
TABLE F9 AS FREQUENCY OF INFRAGRI.S5_38_1B
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_9.html" UTF8
TABLE F10 AS FREQUENCY OF INFRAGRI.S5_38_1C
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_10.html" UTF8
TABLE F11 AS FREQUENCY OF GANADERIA.S6_P40
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_11.html" UTF8
TABLE F12 AS FREQUENCY OF GANADERIA.S6_P43
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_12.html" UTF8
TABLE F13 AS FREQUENCY OF GANADERIA.S6_P45_1
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_13.html" UTF8
TABLE F14 AS FREQUENCY OF GANADERIA.S6_P45_2
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_14.html" UTF8
TABLE F15 AS FREQUENCY OF GANADERIA.S6_P45_3
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_15.html" UTF8
TABLE F16 AS FREQUENCY OF GANADERIA.S6_P46
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_16.html" UTF8
TABLE F17 AS FREQUENCY OF GANADERIA.S6_P47_1
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_17.html" UTF8
TABLE F18 AS FREQUENCY OF GANADERIA.S6_P47_2
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_18.html" UTF8
TABLE F19 AS FREQUENCY OF GANADERIA.S6_P47_3
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_19.html" UTF8
TABLE F20 AS FREQUENCY OF GANADERIA.S6_P48
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_20.html" UTF8
TABLE F21 AS FREQUENCY OF GANADERIA.S6_P50
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_21.html" UTF8
TABLE F22 AS FREQUENCY OF GANADERIA.S6_P52_1
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_22.html" UTF8
TABLE F23 AS FREQUENCY OF GANADERIA.S6_P52_2
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02_23.html" UTF8
DEFINE MUNIC.NUP AS COUNT UPA TYPE INTEGER
TABLE ENDLIST AS AREALIST OF MUNIC, MUNIC.NUP
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_02.csv" UTF8
