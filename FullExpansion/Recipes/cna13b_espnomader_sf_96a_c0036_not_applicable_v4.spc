RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V28 AS COUNT ESPNOMADER FILTER (ESPNOMADER.S9_F96 = "0323138") AND NOTAPPLICABLE(ESPNOMADER.SF_96A) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V28
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espnomader_sf_96a_c0036_not_applicable.csv" UTF8
