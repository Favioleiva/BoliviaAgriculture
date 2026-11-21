RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R1 AS COUNT CULTSEM FILTER CULTSEM.S4_P25_A = "01211000" TYPE INTEGER
DEFINE MUNIC.V2 AS COUNT UPA FILTER UPA.R1 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V2
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01211000_semillas_todos_upa_con_registros.csv" UTF8
