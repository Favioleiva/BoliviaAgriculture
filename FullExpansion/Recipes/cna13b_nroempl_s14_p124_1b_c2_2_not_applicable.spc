RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V56 AS COUNT NROEMPL FILTER (NROEMPL.S14_P123 = 2 AND NROEMPL.S14_P12A = 2) AND NOTAPPLICABLE(NROEMPL.S14_P124_1B) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V56
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_nroempl_s14_p124_1b_c2_2_not_applicable.csv" UTF8
