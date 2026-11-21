RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R18 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01961048" TYPE INTEGER
DEFINE MUNIC.V240 AS COUNT UPA FILTER UPA.R18 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V240
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01961048_verano2012_2013_todos_upa_con_registros.csv" UTF8
