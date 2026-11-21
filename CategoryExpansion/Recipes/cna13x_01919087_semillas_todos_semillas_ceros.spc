RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V126 AS COUNT CULTSEM FILTER CULTSEM.S4_P25_A = "01919087" AND CULTSEM.S4_P25_B = 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V126
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01919087_semillas_todos_semillas_ceros.csv" UTF8
