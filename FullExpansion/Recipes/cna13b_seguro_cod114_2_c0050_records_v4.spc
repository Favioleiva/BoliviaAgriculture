RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V57 AS COUNT SEGURO FILTER SEGURO.COD114_2 = "0135601" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V57
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_seguro_cod114_2_c0050_records.csv" UTF8
