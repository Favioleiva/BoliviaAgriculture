RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V63 AS COUNT CULTFRU FILTER CULTFRU.S4_P29_1A = "0131929" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V63
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultfru_s4_p29_1a_c0031_records.csv" UTF8
