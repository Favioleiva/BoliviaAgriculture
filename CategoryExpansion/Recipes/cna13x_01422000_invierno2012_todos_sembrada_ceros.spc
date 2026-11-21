RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V14 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01422000" AND CULTINV.S4_P23_3 = 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V14
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01422000_invierno2012_todos_sembrada_ceros.csv" UTF8
