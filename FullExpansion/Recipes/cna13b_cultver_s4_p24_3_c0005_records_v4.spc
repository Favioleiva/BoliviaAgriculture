RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V39 AS COUNT CULTVER FILTER CULTVER.S4_P24_3 = "S2" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V39
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultver_s4_p24_3_c0005_records.csv" UTF8
