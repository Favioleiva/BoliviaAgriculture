RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V124 AS COUNT CULTSEM FILTER CULTSEM.S4_P25_A = "01221002" AND MISSING(CULTSEM.S4_P25_B) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V124
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01221002_semillas_todos_semillas_missing.csv" UTF8
