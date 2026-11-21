RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V3 AS COUNT BOVINO FILTER (BOVINO.S6_P41A = 6) AND MISSING(BOVINO.S6_P41D) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V3
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_bovino_s6_p41d_c0003_missing.csv" UTF8
