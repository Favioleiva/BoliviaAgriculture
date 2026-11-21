RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V183 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01219002" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V183
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01219002_verano2012_2013_todos_registros.csv" UTF8
