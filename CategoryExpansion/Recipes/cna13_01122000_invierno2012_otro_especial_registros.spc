RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.R5 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01122000" AND (MISSING(CULTINV.S4_P23_4) OR NOTAPPLICABLE(CULTINV.S4_P23_4) OR (CULTINV.S4_P23_4 >= 3 AND CULTINV.S4_P23_4 <= 8)) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.R5
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01122000_invierno2012_otro_especial_registros.csv" UTF8
