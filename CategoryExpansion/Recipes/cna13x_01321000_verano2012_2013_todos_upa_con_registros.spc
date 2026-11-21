RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R11 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01321000" TYPE INTEGER
DEFINE MUNIC.V142 AS COUNT UPA FILTER UPA.R11 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V142
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01321000_verano2012_2013_todos_upa_con_registros.csv" UTF8
