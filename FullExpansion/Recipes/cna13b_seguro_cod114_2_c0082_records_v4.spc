RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V121 AS COUNT SEGURO FILTER SEGURO.COD114_2 = "0180201" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V121
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_seguro_cod114_2_c0082_records.csv" UTF8
