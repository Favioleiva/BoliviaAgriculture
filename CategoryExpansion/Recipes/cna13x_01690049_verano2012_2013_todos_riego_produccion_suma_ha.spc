RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V259 AS SUM CULTVER.S4_P24_4 FILTER CULTVER.S4_P24_2 = "01690049" AND CULTVER.S4_P24_4 >= 0.000000 AND CULTVER.S4_P24_4 <= 99999999999.000000 TYPE REAL DECIMALS 6
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V259
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01690049_verano2012_2013_todos_riego_produccion_suma_ha.csv" UTF8
