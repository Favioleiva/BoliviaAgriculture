RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V111 AS SUM CULTSEM.S4_P25_B FILTER CULTSEM.S4_P25_A = "01272001" AND CULTSEM.S4_P25_B >= 0.000000 AND CULTSEM.S4_P25_B <= 99999999999.000000 TYPE REAL DECIMALS 6
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V111
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01272001_semillas_todos_semillas_suma_ha.csv" UTF8
