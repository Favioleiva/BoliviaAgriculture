RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V132 AS COUNT GANADERIA FILTER NOTAPPLICABLE(GANADERIA.S6_P44) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V132
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ganaderia_s6_p44_all_not_applicable.csv" UTF8
