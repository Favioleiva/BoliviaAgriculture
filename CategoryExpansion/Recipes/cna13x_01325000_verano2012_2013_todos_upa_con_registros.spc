RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R15 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01325000" TYPE INTEGER
DEFINE MUNIC.V198 AS COUNT UPA FILTER UPA.R15 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V198
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01325000_verano2012_2013_todos_upa_con_registros.csv" UTF8
