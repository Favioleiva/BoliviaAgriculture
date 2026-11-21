RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R12 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01219005" TYPE INTEGER
DEFINE MUNIC.V90 AS COUNT UPA FILTER UPA.R12 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V90
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01219005_invierno2012_todos_upa_con_registros.csv" UTF8
