RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V75 AS COUNT CULTFRU FILTER (CULTFRU.S4_P29_1A = "0139010") AND MISSING(CULTFRU.S4_P29D) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V75
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultfru_s4_p29d_c0079_missing.csv" UTF8
