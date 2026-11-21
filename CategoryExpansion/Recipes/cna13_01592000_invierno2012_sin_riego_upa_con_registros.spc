RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R33 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01592000" AND CULTINV.S4_P23_4 = 2 TYPE INTEGER
DEFINE MUNIC.U33 AS COUNT UPA FILTER UPA.R33 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.U33
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01592000_invierno2012_sin_riego_upa_con_registros.csv" UTF8
