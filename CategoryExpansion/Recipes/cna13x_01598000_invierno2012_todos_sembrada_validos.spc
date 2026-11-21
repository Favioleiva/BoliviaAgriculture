RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V59 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01598000" AND CULTINV.S4_P23_3 >= 0.000000 AND CULTINV.S4_P23_3 <= 999999.000000 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V59
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01598000_invierno2012_todos_sembrada_validos.csv" UTF8
