RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R7 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01510000" AND CULTVER.S4_P24_5 = 1 TYPE INTEGER
DEFINE MUNIC.U7 AS COUNT UPA FILTER UPA.R7 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.U7
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01510000_verano2012_2013_con_riego_upa_con_registros.csv" UTF8
