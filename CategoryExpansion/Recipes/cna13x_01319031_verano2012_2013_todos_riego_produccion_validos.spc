RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V115 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01319031" AND CULTVER.S4_P24_4 >= 0.000000 AND CULTVER.S4_P24_4 <= 99999999999.000000 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V115
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01319031_verano2012_2013_todos_riego_produccion_validos.csv" UTF8
