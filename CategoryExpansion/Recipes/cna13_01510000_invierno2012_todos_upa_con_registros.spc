RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R1 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01510000" TYPE INTEGER
DEFINE MUNIC.U1 AS COUNT UPA FILTER UPA.R1 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.U1
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01510000_invierno2012_todos_upa_con_registros.csv" UTF8
