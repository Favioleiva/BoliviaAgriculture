RUNDEF discover_05
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

TABLE F0 AS FREQUENCY OF ALPACA.S6_P67A
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_0.html" UTF8
TABLE F1 AS FREQUENCY OF OTRESP.S6_P70_1
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_1.html" UTF8
TABLE F2 AS FREQUENCY OF AVESG.S6_P73_1
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_2.html" UTF8
TABLE F3 AS FREQUENCY OF AVESC.S6_P76_2
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_3.html" UTF8
TABLE F4 AS FREQUENCY OF EQUIPAVE.S6_P74A
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_4.html" UTF8
TABLE F5 AS FREQUENCY OF EQUIPAVE.S6_P74C
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_5.html" UTF8
TABLE F6 AS FREQUENCY OF EQUIPAVE.S6_P74D
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_6.html" UTF8
TABLE F7 AS FREQUENCY OF SANIDAD.S7_P83_11
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_7.html" UTF8
TABLE F8 AS FREQUENCY OF SANIDAD.S7_P83_12
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_8.html" UTF8
TABLE F9 AS FREQUENCY OF SANIDAD.S7_P83_2
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_9.html" UTF8
TABLE F10 AS FREQUENCY OF SANIDAD.S7_P83_3
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_10.html" UTF8
TABLE F11 AS FREQUENCY OF SANIDAD.S7_P83_4
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_11.html" UTF8
TABLE F12 AS FREQUENCY OF SANIDAD.S7_P83_5
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_12.html" UTF8
TABLE F13 AS FREQUENCY OF SANIDAD.S7_P83_6
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_13.html" UTF8
TABLE F14 AS FREQUENCY OF SANIDAD.S7_P84_1
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_14.html" UTF8
TABLE F15 AS FREQUENCY OF SANIDAD.S7_P84_2
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_15.html" UTF8
TABLE F16 AS FREQUENCY OF SANIDAD.S7_P85_1
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_16.html" UTF8
TABLE F17 AS FREQUENCY OF SANIDAD.S7_P85_2
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_17.html" UTF8
TABLE F18 AS FREQUENCY OF SANIDAD.S7_P85_3
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_18.html" UTF8
TABLE F19 AS FREQUENCY OF INFRGAN.S7_P86
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_19.html" UTF8
TABLE F20 AS FREQUENCY OF INFRGAN.S7_P86B
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_20.html" UTF8
TABLE F21 AS FREQUENCY OF INFRGAN.S7_P86C
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_21.html" UTF8
TABLE F22 AS FREQUENCY OF EQUIGAN.S7_P87_1A
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_22.html" UTF8
TABLE F23 AS FREQUENCY OF EQUIGAN.PRIMER_ANO
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05_23.html" UTF8
DEFINE MUNIC.NUP AS COUNT UPA TYPE INTEGER
TABLE ENDLIST AS AREALIST OF MUNIC, MUNIC.NUP
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_05.csv" UTF8
