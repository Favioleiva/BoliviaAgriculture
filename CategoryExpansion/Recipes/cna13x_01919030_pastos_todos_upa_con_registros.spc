RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R8 AS COUNT CULTPAS FILTER CULTPAS.S4_P26_A = "01919030" TYPE INTEGER
DEFINE MUNIC.V58 AS COUNT UPA FILTER UPA.R8 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V58
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01919030_pastos_todos_upa_con_registros.csv" UTF8
