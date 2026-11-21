RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V74 AS COUNT PORCINOG FILTER ((PORCINOG.S6_P55E >= 0 AND PORCINOG.S6_P55E <= 99999)) AND NOT MISSING(PORCINOG.S6_P55E) AND NOT NOTAPPLICABLE(PORCINOG.S6_P55E) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V74
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_porcinog_s6_p55e_species_total_valid.csv" UTF8
