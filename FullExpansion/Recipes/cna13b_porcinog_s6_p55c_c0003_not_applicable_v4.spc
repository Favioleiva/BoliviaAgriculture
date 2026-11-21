RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V20 AS COUNT PORCINOG FILTER (PORCINOG.S6_P55A = "04") AND NOTAPPLICABLE(PORCINOG.S6_P55C) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V20
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_porcinog_s6_p55c_c0003_not_applicable.csv" UTF8
