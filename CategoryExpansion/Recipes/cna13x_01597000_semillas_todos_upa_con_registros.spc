RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R7 AS COUNT CULTSEM FILTER CULTSEM.S4_P25_A = "01597000" TYPE INTEGER
DEFINE MUNIC.V50 AS COUNT UPA FILTER UPA.R7 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V50
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01597000_semillas_todos_upa_con_registros.csv" UTF8
