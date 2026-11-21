RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V84 AS COUNT CULTPAS FILTER CULTPAS.S4_P26_A = "01919033" AND MISSING(CULTPAS.S4_P26_B) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V84
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01919033_pastos_todos_pastos_missing.csv" UTF8
