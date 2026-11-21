RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V11 AS COUNT CULTOTR FILTER CULTOTR.S4_P27_D = "07000020" AND CULTOTR.S4_P27_E >= 0.000000 AND CULTOTR.S4_P27_E <= 99999999999.000000 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V11
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_07000020_otros_usos_todos_otros_usos_validos.csv" UTF8
