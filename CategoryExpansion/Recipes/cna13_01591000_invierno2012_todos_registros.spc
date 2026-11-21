RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.R11 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01591000" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.R11
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01591000_invierno2012_todos_registros.csv" UTF8
