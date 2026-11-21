RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V19 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01316000" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V19
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultver_s4_p24_8_c0064_records.csv" UTF8
