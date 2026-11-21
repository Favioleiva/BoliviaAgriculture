RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V61 AS COUNT CULTMED FILTER CULTMED.S4_P30_1 = "0135401" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V61
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultmed_s4_p30_1_c0105_records.csv" UTF8
