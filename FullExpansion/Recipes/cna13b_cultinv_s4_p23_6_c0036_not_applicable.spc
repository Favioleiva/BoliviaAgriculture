RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V134 AS COUNT CULTINV FILTER (CULTINV.S4_P23_2 = "01245000") AND NOTAPPLICABLE(CULTINV.S4_P23_6) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V134
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultinv_s4_p23_6_c0036_not_applicable.csv" UTF8
