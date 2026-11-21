RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V45 AS COUNT CULTSEM FILTER CULTSEM.S4_P25_A = "01708000" AND NOTAPPLICABLE(CULTSEM.S4_P25_B) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V45
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01708000_semillas_todos_semillas_no_aplica.csv" UTF8
