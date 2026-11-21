RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.F8A1M3 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01122000" AND CULTVER.S4_P24_5 = 2 AND CULTVER.S4_P24_4_1 = 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.F8A1M3
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01122000_verano2012_2013_sin_riego_uso_suelo_ceros.csv" UTF8
