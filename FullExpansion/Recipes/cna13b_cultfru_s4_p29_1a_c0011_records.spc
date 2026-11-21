RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V23 AS COUNT CULTFRU FILTER CULTFRU.S4_P29_1A = "0131905" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V23
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultfru_s4_p29_1a_c0011_records.csv" UTF8
