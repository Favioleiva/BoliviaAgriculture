RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R5 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01152001" TYPE INTEGER
DEFINE MUNIC.V34 AS COUNT UPA FILTER UPA.R5 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V34
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01152001_invierno2012_todos_upa_con_registros.csv" UTF8
