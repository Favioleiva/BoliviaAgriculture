RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R24 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01112000" AND CULTINV.S4_P23_4 = 9 TYPE INTEGER
DEFINE MUNIC.U24 AS COUNT UPA FILTER UPA.R24 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.U24
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01112000_invierno2012_sin_dato_upa_con_registros.csv" UTF8
