RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V271 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01929007" AND NOTAPPLICABLE(CULTVER.S4_P24_4) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V271
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01929007_verano2012_2013_todos_riego_produccion_no_aplica.csv" UTF8
