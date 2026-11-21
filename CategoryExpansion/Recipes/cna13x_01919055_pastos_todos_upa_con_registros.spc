RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R13 AS COUNT CULTPAS FILTER CULTPAS.S4_P26_A = "01919055" TYPE INTEGER
DEFINE MUNIC.V98 AS COUNT UPA FILTER UPA.R13 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V98
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01919055_pastos_todos_upa_con_registros.csv" UTF8
