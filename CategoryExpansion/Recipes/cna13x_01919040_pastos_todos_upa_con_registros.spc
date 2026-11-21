RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R18 AS COUNT CULTPAS FILTER CULTPAS.S4_P26_A = "01919040" TYPE INTEGER
DEFINE MUNIC.V138 AS COUNT UPA FILTER UPA.R18 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V138
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01919040_pastos_todos_upa_con_registros.csv" UTF8
