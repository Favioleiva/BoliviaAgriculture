RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V135 AS COUNT CULTFRU FILTER CULTFRU.S4_P29_1A = "0137100" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V135
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultfru_s4_p29_1a_c0067_records.csv" UTF8
