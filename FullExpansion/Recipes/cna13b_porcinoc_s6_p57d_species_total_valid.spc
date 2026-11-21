RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V106 AS COUNT PORCINOC FILTER ((PORCINOC.S6_P57D >= 0 AND PORCINOC.S6_P57D <= 9999)) AND NOT MISSING(PORCINOC.S6_P57D) AND NOT NOTAPPLICABLE(PORCINOC.S6_P57D) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V106
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_porcinoc_s6_p57d_species_total_valid.csv" UTF8
