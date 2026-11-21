RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R14 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01690004" TYPE INTEGER
DEFINE MUNIC.V184 AS COUNT UPA FILTER UPA.R14 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V184
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01690004_verano2012_2013_todos_upa_con_registros.csv" UTF8
