RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R3 AS COUNT CULTPAS FILTER CULTPAS.S4_P26_A = "01919045" TYPE INTEGER
DEFINE MUNIC.V18 AS COUNT UPA FILTER UPA.R3 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V18
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01919045_pastos_todos_upa_con_registros.csv" UTF8
