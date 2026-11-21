RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V115 AS COUNT CAPRINO FILTER (CAPRINO.S6_P60A = 2 OR CAPRINO.S6_P60A = 3 OR CAPRINO.S6_P60A = 4) AND (MISSING(CAPRINO.S6_P60B)) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V115
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_caprino_s6_p60b_species_total_missing_v3.csv" UTF8
