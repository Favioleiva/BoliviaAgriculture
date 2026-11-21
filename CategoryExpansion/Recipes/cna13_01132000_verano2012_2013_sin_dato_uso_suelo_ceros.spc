RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.F19A1M3 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01132000" AND CULTVER.S4_P24_5 = 9 AND CULTVER.S4_P24_4_1 = 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.F19A1M3
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01132000_verano2012_2013_sin_dato_uso_suelo_ceros.csv" UTF8
