RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V36 AS COUNT CULTFOR FILTER CULTFOR.S4_P27_A = "03120043" AND MISSING(CULTFOR.S4_P27_B) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V36
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_03120043_forestal_todos_forestal_missing.csv" UTF8
