RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V99 AS COUNT PORCINOC FILTER (PORCINOC.S6_P57A = "02" OR PORCINOC.S6_P57A = "03" OR PORCINOC.S6_P57A = "04") AND (MISSING(PORCINOC.S6_P57C)) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V99
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_porcinoc_s6_p57c_species_total_missing_v2.csv" UTF8
