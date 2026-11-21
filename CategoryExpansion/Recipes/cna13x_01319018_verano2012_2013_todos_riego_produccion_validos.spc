RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V31 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01319018" AND CULTVER.S4_P24_4 >= 0.000000 AND CULTVER.S4_P24_4 <= 99999999999.000000 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V31
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01319018_verano2012_2013_todos_riego_produccion_validos.csv" UTF8
