RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V57 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01218002" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V57
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01218002_invierno2012_todos_registros.csv" UTF8
