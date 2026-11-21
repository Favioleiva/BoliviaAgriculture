RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R15 AS COUNT CULTPAS FILTER CULTPAS.S4_P26_A = "01919057" TYPE INTEGER
DEFINE MUNIC.V114 AS COUNT UPA FILTER UPA.R15 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V114
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01919057_pastos_todos_upa_con_registros.csv" UTF8
