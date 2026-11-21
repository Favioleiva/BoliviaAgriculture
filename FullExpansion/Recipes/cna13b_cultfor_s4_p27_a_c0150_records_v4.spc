RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V93 AS COUNT CULTFOR FILTER CULTFOR.S4_P27_A = "03120197" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V93
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultfor_s4_p27_a_c0150_records.csv" UTF8
