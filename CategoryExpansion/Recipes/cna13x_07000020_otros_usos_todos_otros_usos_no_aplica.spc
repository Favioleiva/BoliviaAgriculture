RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V13 AS COUNT CULTOTR FILTER CULTOTR.S4_P27_D = "07000020" AND NOTAPPLICABLE(CULTOTR.S4_P27_E) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V13
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_07000020_otros_usos_todos_otros_usos_no_aplica.csv" UTF8
