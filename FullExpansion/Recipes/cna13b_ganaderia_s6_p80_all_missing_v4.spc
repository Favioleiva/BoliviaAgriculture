RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V139 AS COUNT GANADERIA FILTER MISSING(GANADERIA.S6_P80) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V139
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ganaderia_s6_p80_all_missing.csv" UTF8
