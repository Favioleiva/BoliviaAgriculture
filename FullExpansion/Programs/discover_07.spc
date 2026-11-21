RUNDEF discover_07
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

TABLE F0 AS FREQUENCY OF ESPPESCA.S10_P101C
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_0.html" UTF8
TABLE F1 AS FREQUENCY OF ESPCRIA.S10_P104B
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_1.html" UTF8
TABLE F2 AS FREQUENCY OF OTROSDAT.S15_P126
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_2.html" UTF8
TABLE F3 AS FREQUENCY OF OTROSDAT.S15_P127A
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_3.html" UTF8
TABLE F4 AS FREQUENCY OF OTROSDAT.S15_P127B
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_4.html" UTF8
TABLE F5 AS FREQUENCY OF OTROSDAT.S15_P128
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_5.html" UTF8
TABLE F6 AS FREQUENCY OF OTROSDAT.S15_P130
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_6.html" UTF8
TABLE F7 AS FREQUENCY OF COMPFAM.S15_P129_1
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_7.html" UTF8
TABLE F8 AS FREQUENCY OF COMPFAM.S15_P129_2
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_8.html" UTF8
TABLE F9 AS FREQUENCY OF COMPFAM.S15_P129_3
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_9.html" UTF8
TABLE F10 AS FREQUENCY OF COMPFAM.S15_P129_4
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_10.html" UTF8
TABLE F11 AS FREQUENCY OF COMPFAM.S15_P129_5
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_11.html" UTF8
TABLE F12 AS FREQUENCY OF COMPFAM.S15_P129_6
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_12.html" UTF8
TABLE F13 AS FREQUENCY OF COMPFAM.S15_P129_7
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_13.html" UTF8
TABLE F14 AS FREQUENCY OF PERSONAL.S14_P123_1
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_14.html" UTF8
TABLE F15 AS FREQUENCY OF PERSONAL.S14_P123_2
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_15.html" UTF8
TABLE F16 AS FREQUENCY OF PERSONAL.S14_P124
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_16.html" UTF8
TABLE F17 AS FREQUENCY OF PERSONAL.S14_P125
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_17.html" UTF8
TABLE F18 AS FREQUENCY OF NROEMPL.S14_P123
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_18.html" UTF8
TABLE F19 AS FREQUENCY OF NROEMPL.S14_P12A
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_19.html" UTF8
TABLE F20 AS FREQUENCY OF ENERGIA.S13_P117_1
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_20.html" UTF8
TABLE F21 AS FREQUENCY OF ENERGIA.S13_P117_2
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_21.html" UTF8
TABLE F22 AS FREQUENCY OF ENERGIA.S13_P117_3
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_22.html" UTF8
TABLE F23 AS FREQUENCY OF ENERGIA.S13_P117_4
 OUTPUTFILE HTML "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07_23.html" UTF8
DEFINE MUNIC.NUP AS COUNT UPA TYPE INTEGER
TABLE ENDLIST AS AREALIST OF MUNIC, MUNIC.NUP
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\Results\discover_07.csv" UTF8
