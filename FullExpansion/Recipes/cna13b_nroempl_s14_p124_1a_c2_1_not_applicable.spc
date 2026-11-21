RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V16 AS COUNT NROEMPL FILTER (NROEMPL.S14_P123 = 2 AND NROEMPL.S14_P12A = 1) AND NOTAPPLICABLE(NROEMPL.S14_P124_1A) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V16
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_nroempl_s14_p124_1a_c2_1_not_applicable.csv" UTF8
