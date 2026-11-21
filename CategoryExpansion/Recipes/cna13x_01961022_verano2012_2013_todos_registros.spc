RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V267 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01961022" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V267
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01961022_verano2012_2013_todos_registros.csv" UTF8
