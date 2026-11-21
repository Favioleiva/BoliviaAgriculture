RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.R15 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01132000" AND (MISSING(CULTINV.S4_P23_4) OR NOTAPPLICABLE(CULTINV.S4_P23_4) OR (CULTINV.S4_P23_4 >= 3 AND CULTINV.S4_P23_4 <= 8)) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.R15
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01132000_invierno2012_otro_especial_registros.csv" UTF8
