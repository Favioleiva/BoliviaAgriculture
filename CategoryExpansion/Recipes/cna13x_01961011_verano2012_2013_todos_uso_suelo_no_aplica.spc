RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V123 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01961011" AND NOTAPPLICABLE(CULTVER.S4_P24_4_1) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V123
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01961011_verano2012_2013_todos_uso_suelo_no_aplica.csv" UTF8
