RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V153 AS COUNT ESPNOMADER FILTER ESPNOMADER.S9_F96 = "0323241" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V153
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espnomader_sf_96a_c0072_records.csv" UTF8
