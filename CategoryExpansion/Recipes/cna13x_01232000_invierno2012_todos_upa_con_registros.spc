RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R19 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01232000" TYPE INTEGER
DEFINE MUNIC.V146 AS COUNT UPA FILTER UPA.R19 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V146
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01232000_invierno2012_todos_upa_con_registros.csv" UTF8
