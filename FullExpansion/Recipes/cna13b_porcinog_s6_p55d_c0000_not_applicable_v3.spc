RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V28 AS COUNT PORCINOG FILTER (TRIM(PORCINOG.S6_P55A) = "1") AND NOTAPPLICABLE(PORCINOG.S6_P55D) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V28
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_porcinog_s6_p55d_c0000_not_applicable.csv" UTF8
