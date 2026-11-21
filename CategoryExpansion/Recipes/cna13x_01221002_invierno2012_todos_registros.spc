RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V105 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01221002" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V105
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01221002_invierno2012_todos_registros.csv" UTF8
