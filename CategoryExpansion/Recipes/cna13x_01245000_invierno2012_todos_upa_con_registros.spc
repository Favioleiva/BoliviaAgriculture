RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R7 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01245000" TYPE INTEGER
DEFINE MUNIC.V50 AS COUNT UPA FILTER UPA.R7 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V50
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01245000_invierno2012_todos_upa_con_registros.csv" UTF8
