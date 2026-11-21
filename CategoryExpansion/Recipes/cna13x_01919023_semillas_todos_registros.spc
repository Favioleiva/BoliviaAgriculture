RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V121 AS COUNT CULTSEM FILTER CULTSEM.S4_P25_A = "01919023" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V121
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01919023_semillas_todos_registros.csv" UTF8
