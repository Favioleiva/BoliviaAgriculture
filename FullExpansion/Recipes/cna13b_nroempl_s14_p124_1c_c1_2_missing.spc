RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V71 AS COUNT NROEMPL FILTER (NROEMPL.S14_P123 = 1 AND NROEMPL.S14_P12A = 2) AND MISSING(NROEMPL.S14_P124_1C) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V71
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_nroempl_s14_p124_1c_c1_2_missing.csv" UTF8
