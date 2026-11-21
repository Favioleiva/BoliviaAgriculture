RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V1 AS COUNT CULTOTR FILTER CULTOTR.S4_P27_D = "07000010" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V1
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_07000010_otros_usos_todos_registros.csv" UTF8
