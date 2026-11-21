RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V29 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01214001" AND NOTAPPLICABLE(CULTINV.S4_P23_3) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V29
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01214001_invierno2012_todos_sembrada_no_aplica.csv" UTF8
