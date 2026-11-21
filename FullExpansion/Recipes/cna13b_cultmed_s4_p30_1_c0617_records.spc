RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V125 AS COUNT CULTMED FILTER CULTMED.S4_P30_1 = "0323116" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V125
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultmed_s4_p30_1_c0617_records.csv" UTF8
