RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.R1 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01122000" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.R1
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01122000_invierno2012_todos_registros.csv" UTF8
