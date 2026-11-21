RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R36 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01592000" TYPE INTEGER
DEFINE MUNIC.U36 AS COUNT UPA FILTER UPA.R36 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.U36
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13_01592000_verano2012_2013_todos_upa_con_registros.csv" UTF8
