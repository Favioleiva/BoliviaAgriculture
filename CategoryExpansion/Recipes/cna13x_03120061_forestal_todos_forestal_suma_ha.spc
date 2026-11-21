RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V159 AS SUM CULTFOR.S4_P27_B FILTER CULTFOR.S4_P27_A = "03120061" AND CULTFOR.S4_P27_B >= 0.000000 AND CULTFOR.S4_P27_B <= 99999999999.000000 TYPE REAL DECIMALS 6
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V159
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_03120061_forestal_todos_forestal_suma_ha.csv" UTF8
