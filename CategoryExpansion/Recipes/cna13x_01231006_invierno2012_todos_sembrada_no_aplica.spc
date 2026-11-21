RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V141 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01231006" AND NOTAPPLICABLE(CULTINV.S4_P23_3) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V141
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01231006_invierno2012_todos_sembrada_no_aplica.csv" UTF8
