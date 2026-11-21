RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V65 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01219002" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V65
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01219002_invierno2012_todos_registros.csv" UTF8
