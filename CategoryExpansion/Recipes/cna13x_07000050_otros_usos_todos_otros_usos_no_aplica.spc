RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V37 AS COUNT CULTOTR FILTER CULTOTR.S4_P27_D = "07000050" AND NOTAPPLICABLE(CULTOTR.S4_P27_E) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V37
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_07000050_otros_usos_todos_otros_usos_no_aplica.csv" UTF8
