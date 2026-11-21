RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.F38A1M1 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01592000" AND CULTVER.S4_P24_5 = 2 AND MISSING(CULTVER.S4_P24_4_1) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.F38A1M1
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01592000_verano2012_2013_sin_riego_uso_suelo_missing.csv" UTF8
