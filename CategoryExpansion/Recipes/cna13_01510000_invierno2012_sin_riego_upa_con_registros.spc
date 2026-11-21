RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R3 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01510000" AND CULTINV.S4_P23_4 = 2 TYPE INTEGER
DEFINE MUNIC.U3 AS COUNT UPA FILTER UPA.R3 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.U3
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01510000_invierno2012_sin_riego_upa_con_registros.csv" UTF8
