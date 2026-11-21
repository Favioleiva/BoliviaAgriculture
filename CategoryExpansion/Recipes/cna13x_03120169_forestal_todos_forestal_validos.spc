RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V19 AS COUNT CULTFOR FILTER CULTFOR.S4_P27_A = "03120169" AND CULTFOR.S4_P27_B >= 0.000000 AND CULTFOR.S4_P27_B <= 99999999999.000000 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V19
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_03120169_forestal_todos_forestal_validos.csv" UTF8
