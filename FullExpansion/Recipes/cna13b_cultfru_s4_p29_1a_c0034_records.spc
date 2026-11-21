RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V69 AS COUNT CULTFRU FILTER CULTFRU.S4_P29_1A = "0132100" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V69
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultfru_s4_p29_1a_c0034_records.csv" UTF8
