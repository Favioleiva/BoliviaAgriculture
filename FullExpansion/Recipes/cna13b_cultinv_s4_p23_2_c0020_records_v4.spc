RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V71 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01221001" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V71
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultinv_s4_p23_2_c0020_records.csv" UTF8
