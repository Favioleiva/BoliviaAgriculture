RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V91 AS COUNT CULTSEM FILTER CULTSEM.S4_P25_A = "01219004" AND CULTSEM.S4_P25_B >= 0.000000 AND CULTSEM.S4_P25_B <= 99999999999.000000 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V91
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_01219004_semillas_todos_semillas_validos.csv" UTF8
