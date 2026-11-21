RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V115 AS COUNT CULTMED FILTER CULTMED.S4_P30_1 = "0323316" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V115
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultmed_s4_p30_1_c0772_records.csv" UTF8
