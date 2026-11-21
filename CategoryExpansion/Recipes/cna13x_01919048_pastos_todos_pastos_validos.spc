RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V43 AS COUNT CULTPAS FILTER CULTPAS.S4_P26_A = "01919048" AND CULTPAS.S4_P26_B >= 0.000000 AND CULTPAS.S4_P26_B <= 99999999999.000000 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V43
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01919048_pastos_todos_pastos_validos.csv" UTF8
