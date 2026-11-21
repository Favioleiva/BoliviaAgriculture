RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V40 AS COUNT NROEMPL FILTER (NROEMPL.S14_P123 = 1 AND NROEMPL.S14_P12A = 2) AND NOTAPPLICABLE(NROEMPL.S14_P124_1B) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V40
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_nroempl_s14_p124_1b_c1_2_not_applicable.csv" UTF8
