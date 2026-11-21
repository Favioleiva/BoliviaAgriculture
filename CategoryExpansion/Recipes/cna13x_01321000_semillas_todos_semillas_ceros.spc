RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V134 AS COUNT CULTSEM FILTER CULTSEM.S4_P25_A = "01321000" AND CULTSEM.S4_P25_B = 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V134
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01321000_semillas_todos_semillas_ceros.csv" UTF8
