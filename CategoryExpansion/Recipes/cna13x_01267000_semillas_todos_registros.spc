RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V73 AS COUNT CULTSEM FILTER CULTSEM.S4_P25_A = "01267000" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V73
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01267000_semillas_todos_registros.csv" UTF8
