RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.R29 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01112000" AND CULTVER.S4_P24_5 = 9 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.R29
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01112000_verano2012_2013_sin_dato_registros.csv" UTF8
