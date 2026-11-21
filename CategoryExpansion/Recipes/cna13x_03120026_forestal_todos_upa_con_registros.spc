RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R9 AS COUNT CULTFOR FILTER CULTFOR.S4_P27_A = "03120026" TYPE INTEGER
DEFINE MUNIC.V66 AS COUNT UPA FILTER UPA.R9 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V66
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_03120026_forestal_todos_upa_con_registros.csv" UTF8
