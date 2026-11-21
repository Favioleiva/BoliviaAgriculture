RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.F4A0M1 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01122000" AND CULTINV.S4_P23_4 = 9 AND MISSING(CULTINV.S4_P23_3) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.F4A0M1
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01122000_invierno2012_sin_dato_sembrada_missing.csv" UTF8
