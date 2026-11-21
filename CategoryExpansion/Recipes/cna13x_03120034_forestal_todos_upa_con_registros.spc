RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R17 AS COUNT CULTFOR FILTER CULTFOR.S4_P27_A = "03120034" TYPE INTEGER
DEFINE MUNIC.V130 AS COUNT UPA FILTER UPA.R17 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V130
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_03120034_forestal_todos_upa_con_registros.csv" UTF8
