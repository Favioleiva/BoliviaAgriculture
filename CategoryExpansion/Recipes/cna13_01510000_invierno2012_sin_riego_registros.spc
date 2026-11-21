RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.R3 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01510000" AND CULTINV.S4_P23_4 = 2 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.R3
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01510000_invierno2012_sin_riego_registros.csv" UTF8
