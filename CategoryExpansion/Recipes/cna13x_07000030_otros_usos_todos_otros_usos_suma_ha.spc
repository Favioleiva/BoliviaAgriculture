RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V23 AS SUM CULTOTR.S4_P27_E FILTER CULTOTR.S4_P27_D = "07000030" AND CULTOTR.S4_P27_E >= 0.000000 AND CULTOTR.S4_P27_E <= 99999999999.000000 TYPE REAL DECIMALS 6
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V23
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_07000030_otros_usos_todos_otros_usos_suma_ha.csv" UTF8
