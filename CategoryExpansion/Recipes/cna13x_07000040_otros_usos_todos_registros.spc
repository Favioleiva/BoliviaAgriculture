RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V25 AS COUNT CULTOTR FILTER CULTOTR.S4_P27_D = "07000040" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V25
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_07000040_otros_usos_todos_registros.csv" UTF8
