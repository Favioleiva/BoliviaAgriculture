RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V108 AS COUNT AVESG FILTER (AVESG.S6_P73_1 = "05") AND NOTAPPLICABLE(AVESG.S6_P73_2) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V108
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_avesg_s6_p73_2_c0004_not_applicable.csv" UTF8
