RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V102 AS COUNT CULTVER FILTER (CULTVER.S4_P24_2 = "01326000") AND NOTAPPLICABLE(CULTVER.S4_P24_8) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V102
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultver_s4_p24_8_c0094_not_applicable.csv" UTF8
