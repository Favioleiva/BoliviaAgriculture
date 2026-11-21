RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R16 AS COUNT CULTFOR FILTER CULTFOR.S4_P27_A = "03120012" TYPE INTEGER
DEFINE MUNIC.V122 AS COUNT UPA FILTER UPA.R16 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V122
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_03120012_forestal_todos_upa_con_registros.csv" UTF8
