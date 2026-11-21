RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R17 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01591000" AND CULTVER.S4_P24_5 = 1 TYPE INTEGER
DEFINE MUNIC.U17 AS COUNT UPA FILTER UPA.R17 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.U17
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01591000_verano2012_2013_con_riego_upa_con_registros.csv" UTF8
