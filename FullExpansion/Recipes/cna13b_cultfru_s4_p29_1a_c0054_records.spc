RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V109 AS COUNT CULTFRU FILTER CULTFRU.S4_P29_1A = "0135205" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V109
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultfru_s4_p29_1a_c0054_records.csv" UTF8
