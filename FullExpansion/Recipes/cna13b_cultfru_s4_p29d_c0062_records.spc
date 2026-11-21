RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V97 AS COUNT CULTFRU FILTER CULTFRU.S4_P29_1A = "0135502" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V97
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultfru_s4_p29d_c0062_records.csv" UTF8
