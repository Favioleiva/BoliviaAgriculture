RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V155 AS COUNT ESPNOMADER FILTER (ESPNOMADER.S9_F96 = "0323468") AND MISSING(ESPNOMADER.SF_96A) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V155
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espnomader_sf_96a_c0152_missing.csv" UTF8
