RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R11 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01254000" TYPE INTEGER
DEFINE MUNIC.V82 AS COUNT UPA FILTER UPA.R11 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V82
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01254000_invierno2012_todos_upa_con_registros.csv" UTF8
