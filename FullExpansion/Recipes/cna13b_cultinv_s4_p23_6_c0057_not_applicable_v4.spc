RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V142 AS COUNT CULTINV FILTER (CULTINV.S4_P23_2 = "01598000") AND NOTAPPLICABLE(CULTINV.S4_P23_6) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V142
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultinv_s4_p23_6_c0057_not_applicable.csv" UTF8
