RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V83 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01961028" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V83
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultver_s4_p24_2_c0252_records.csv" UTF8
