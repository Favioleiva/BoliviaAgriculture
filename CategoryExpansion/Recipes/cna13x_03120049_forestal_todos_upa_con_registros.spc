RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R10 AS COUNT CULTFOR FILTER CULTFOR.S4_P27_A = "03120049" TYPE INTEGER
DEFINE MUNIC.V74 AS COUNT UPA FILTER UPA.R10 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V74
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_03120049_forestal_todos_upa_con_registros.csv" UTF8
