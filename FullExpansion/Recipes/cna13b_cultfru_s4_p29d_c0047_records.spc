RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V137 AS COUNT CULTFRU FILTER CULTFRU.S4_P29_1A = "0134901" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V137
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultfru_s4_p29d_c0047_records.csv" UTF8
