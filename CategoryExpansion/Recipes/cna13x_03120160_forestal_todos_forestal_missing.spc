RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V140 AS COUNT CULTFOR FILTER CULTFOR.S4_P27_A = "03120160" AND MISSING(CULTFOR.S4_P27_B) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V140
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_03120160_forestal_todos_forestal_missing.csv" UTF8
