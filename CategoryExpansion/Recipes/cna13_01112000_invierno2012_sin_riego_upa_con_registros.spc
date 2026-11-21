RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R23 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01112000" AND CULTINV.S4_P23_4 = 2 TYPE INTEGER
DEFINE MUNIC.U23 AS COUNT UPA FILTER UPA.R23 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.U23
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01112000_invierno2012_sin_riego_upa_con_registros.csv" UTF8
