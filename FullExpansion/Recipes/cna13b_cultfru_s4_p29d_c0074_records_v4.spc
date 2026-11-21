RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V33 AS COUNT CULTFRU FILTER CULTFRU.S4_P29_1A = "0139004" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V33
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultfru_s4_p29d_c0074_records.csv" UTF8
