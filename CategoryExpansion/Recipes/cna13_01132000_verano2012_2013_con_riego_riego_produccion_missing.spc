RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.F17A0M1 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01132000" AND CULTVER.S4_P24_5 = 1 AND MISSING(CULTVER.S4_P24_4) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.F17A0M1
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01132000_verano2012_2013_con_riego_riego_produccion_missing.csv" UTF8
