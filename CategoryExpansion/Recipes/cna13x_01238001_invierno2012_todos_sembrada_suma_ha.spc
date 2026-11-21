RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V119 AS SUM CULTINV.S4_P23_3 FILTER CULTINV.S4_P23_2 = "01238001" AND CULTINV.S4_P23_3 >= 0.000000 AND CULTINV.S4_P23_3 <= 999999.000000 TYPE REAL DECIMALS 6
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V119
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01238001_invierno2012_todos_sembrada_suma_ha.csv" UTF8
