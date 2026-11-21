RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V99 AS COUNT SEGURO FILTER SEGURO.COD114_2 = "0166200" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V99
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_seguro_cod114_2_c0071_records.csv" UTF8
