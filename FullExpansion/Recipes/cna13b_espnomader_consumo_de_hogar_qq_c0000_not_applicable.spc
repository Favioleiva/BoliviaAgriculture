RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V28 AS COUNT ESPNOMADER FILTER (ESPNOMADER.S9_F96 = "0321102") AND NOTAPPLICABLE(ESPNOMADER.CONSUMO_DE_HOGAR_QQ) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V28
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espnomader_consumo_de_hogar_qq_c0000_not_applicable.csv" UTF8
