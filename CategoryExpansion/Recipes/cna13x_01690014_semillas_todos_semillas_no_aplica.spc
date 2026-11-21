RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V101 AS COUNT CULTSEM FILTER CULTSEM.S4_P25_A = "01690014" AND NOTAPPLICABLE(CULTSEM.S4_P25_B) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V101
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01690014_semillas_todos_semillas_no_aplica.csv" UTF8
