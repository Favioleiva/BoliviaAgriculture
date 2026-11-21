RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V1 AS COUNT CULTFOR FILTER CULTFOR.S4_P27_A = "03088888" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V1
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_03088888_forestal_todos_registros.csv" UTF8
