RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V141 AS COUNT COMPFAM FILTER COMPFAM.S15_P129_1 = 1 AND COMPFAM.S15_P129_2 = 58 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V141
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_compfam_s15_p129_2_producer_c0050_records.csv" UTF8
