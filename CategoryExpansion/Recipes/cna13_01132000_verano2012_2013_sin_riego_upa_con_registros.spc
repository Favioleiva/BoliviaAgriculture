RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R18 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01132000" AND CULTVER.S4_P24_5 = 2 TYPE INTEGER
DEFINE MUNIC.U18 AS COUNT UPA FILTER UPA.R18 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.U18
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01132000_verano2012_2013_sin_riego_upa_con_registros.csv" UTF8
