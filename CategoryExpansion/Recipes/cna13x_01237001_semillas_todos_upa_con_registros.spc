RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R15 AS COUNT CULTSEM FILTER CULTSEM.S4_P25_A = "01237001" TYPE INTEGER
DEFINE MUNIC.V114 AS COUNT UPA FILTER UPA.R15 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V114
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01237001_semillas_todos_upa_con_registros.csv" UTF8
