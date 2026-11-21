RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V134 AS COUNT CULTPAS FILTER CULTPAS.S4_P26_A = "01919082" AND CULTPAS.S4_P26_B = 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V134
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01919082_pastos_todos_pastos_ceros.csv" UTF8
