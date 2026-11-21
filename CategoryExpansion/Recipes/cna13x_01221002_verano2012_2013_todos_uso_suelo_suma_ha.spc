RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V13 AS SUM CULTVER.S4_P24_4_1 FILTER CULTVER.S4_P24_2 = "01221002" AND CULTVER.S4_P24_4_1 >= 0.000000 AND CULTVER.S4_P24_4_1 <= 99999999999.000000 TYPE REAL DECIMALS 6
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V13
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01221002_verano2012_2013_todos_uso_suelo_suma_ha.csv" UTF8
