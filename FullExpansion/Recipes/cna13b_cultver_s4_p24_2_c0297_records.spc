RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V13 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01965000" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V13
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultver_s4_p24_2_c0297_records.csv" UTF8
