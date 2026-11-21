RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V12 AS COUNT BOVINO FILTER (BOVINO.S6_P41A >= 3 AND BOVINO.S6_P41A <= 11) AND NOTAPPLICABLE(BOVINO.S6_P41C) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V12
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_bovino_s6_p41c_species_total_not_applicable.csv" UTF8
