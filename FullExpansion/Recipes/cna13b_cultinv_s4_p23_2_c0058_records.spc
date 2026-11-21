RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V147 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01599002" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V147
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultinv_s4_p23_2_c0058_records.csv" UTF8
