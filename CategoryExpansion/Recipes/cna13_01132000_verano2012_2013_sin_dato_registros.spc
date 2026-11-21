RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.R19 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01132000" AND CULTVER.S4_P24_5 = 9 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.R19
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01132000_verano2012_2013_sin_dato_registros.csv" UTF8
