RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V151 AS COUNT ESPNOMADER FILTER ESPNOMADER.S9_F96 = "0323457" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V151
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espnomader_s9_f96_c0143_records.csv" UTF8
