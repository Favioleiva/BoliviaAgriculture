RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V155 AS COUNT SEGURO FILTER SEGURO.COD114_2 = "0196114" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V155
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_seguro_cod114_2_c0099_records.csv" UTF8
