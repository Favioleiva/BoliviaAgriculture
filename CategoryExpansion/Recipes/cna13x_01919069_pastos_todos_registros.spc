RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V49 AS COUNT CULTPAS FILTER CULTPAS.S4_P26_A = "01919069" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V49
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01919069_pastos_todos_registros.csv" UTF8
