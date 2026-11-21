RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V1 AS COUNT CULTSEM FILTER CULTSEM.S4_P25_A = "01802001" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V1
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01802001_semillas_todos_registros.csv" UTF8
