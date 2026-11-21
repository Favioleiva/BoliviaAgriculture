RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.F24A0M2 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01112000" AND CULTINV.S4_P23_4 = 9 AND NOTAPPLICABLE(CULTINV.S4_P23_3) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.F24A0M2
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01112000_invierno2012_sin_dato_sembrada_no_aplica.csv" UTF8
