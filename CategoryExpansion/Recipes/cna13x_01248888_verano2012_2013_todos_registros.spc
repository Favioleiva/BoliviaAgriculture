RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V225 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01248888" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V225
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01248888_verano2012_2013_todos_registros.csv" UTF8
