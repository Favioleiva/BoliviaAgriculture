RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V15 AS COUNT NROEMPL FILTER (NROEMPL.S14_P123 = 2 AND NROEMPL.S14_P12A = 1) AND MISSING(NROEMPL.S14_P124_1A) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V15
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_nroempl_s14_p124_1a_c2_1_missing.csv" UTF8
