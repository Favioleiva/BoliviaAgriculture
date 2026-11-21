RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R19 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01961049" TYPE INTEGER
DEFINE MUNIC.V254 AS COUNT UPA FILTER UPA.R19 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V254
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01961049_verano2012_2013_todos_upa_con_registros.csv" UTF8
