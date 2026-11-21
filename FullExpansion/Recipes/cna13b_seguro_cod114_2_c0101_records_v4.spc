RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V159 AS COUNT SEGURO FILTER SEGURO.COD114_2 = "0196156" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V159
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_seguro_cod114_2_c0101_records.csv" UTF8
