RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R8 AS COUNT CULTSEM FILTER CULTSEM.S4_P25_A = "01190008" TYPE INTEGER
DEFINE MUNIC.V58 AS COUNT UPA FILTER UPA.R8 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V58
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01190008_semillas_todos_upa_con_registros.csv" UTF8
