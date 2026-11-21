RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V73 AS COUNT CULTPAS FILTER CULTPAS.S4_P26_A = "01919010" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V73
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01919010_pastos_todos_registros.csv" UTF8
