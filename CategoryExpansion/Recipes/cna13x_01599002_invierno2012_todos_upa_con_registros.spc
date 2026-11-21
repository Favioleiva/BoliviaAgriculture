RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R9 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01599002" TYPE INTEGER
DEFINE MUNIC.V66 AS COUNT UPA FILTER UPA.R9 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V66
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01599002_invierno2012_todos_upa_con_registros.csv" UTF8
