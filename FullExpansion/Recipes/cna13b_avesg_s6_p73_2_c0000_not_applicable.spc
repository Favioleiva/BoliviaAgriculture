RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V76 AS COUNT AVESG FILTER (AVESG.S6_P73_1 = "01") AND NOTAPPLICABLE(AVESG.S6_P73_2) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V76
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_avesg_s6_p73_2_c0000_not_applicable.csv" UTF8
