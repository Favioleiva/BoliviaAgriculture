RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R9 AS COUNT CULTSEM FILTER CULTSEM.S4_P25_A = "01260000" TYPE INTEGER
DEFINE MUNIC.V66 AS COUNT UPA FILTER UPA.R9 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V66
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01260000_semillas_todos_upa_con_registros.csv" UTF8
