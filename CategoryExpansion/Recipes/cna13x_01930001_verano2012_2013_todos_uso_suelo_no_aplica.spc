RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V11 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01930001" AND NOTAPPLICABLE(CULTVER.S4_P24_4_1) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V11
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01930001_verano2012_2013_todos_uso_suelo_no_aplica.csv" UTF8
