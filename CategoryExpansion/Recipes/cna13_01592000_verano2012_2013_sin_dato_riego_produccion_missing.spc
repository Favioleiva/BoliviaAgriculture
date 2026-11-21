RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.F39A0M1 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01592000" AND CULTVER.S4_P24_5 = 9 AND MISSING(CULTVER.S4_P24_4) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.F39A0M1
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01592000_verano2012_2013_sin_dato_riego_produccion_missing.csv" UTF8
