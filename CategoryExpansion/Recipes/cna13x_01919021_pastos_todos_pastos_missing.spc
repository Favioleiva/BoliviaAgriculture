RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V4 AS COUNT CULTPAS FILTER CULTPAS.S4_P26_A = "01919021" AND MISSING(CULTPAS.S4_P26_B) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V4
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01919021_pastos_todos_pastos_missing.csv" UTF8
