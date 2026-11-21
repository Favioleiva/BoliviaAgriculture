RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V90 AS COUNT PORCINOC FILTER ((PORCINOC.S6_P57B >= 0 AND PORCINOC.S6_P57B <= 9999)) AND NOT MISSING(PORCINOC.S6_P57B) AND NOT NOTAPPLICABLE(PORCINOC.S6_P57B) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V90
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_porcinoc_s6_p57b_species_total_valid.csv" UTF8
