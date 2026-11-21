RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V3 AS COUNT PORCINOG FILTER (PORCINOG.S6_P55A = "02") AND MISSING(PORCINOG.S6_P55C) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V3
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_porcinog_s6_p55c_c0001_missing.csv" UTF8
