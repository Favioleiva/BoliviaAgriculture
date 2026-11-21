RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V131 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01597000" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V131
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultinv_s4_p23_6_c0056_records.csv" UTF8
