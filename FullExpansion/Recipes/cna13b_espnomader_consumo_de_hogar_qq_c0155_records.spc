RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V145 AS COUNT ESPNOMADER FILTER ESPNOMADER.S9_F96 = "0323472" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V145
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espnomader_consumo_de_hogar_qq_c0155_records.csv" UTF8
