RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V45 AS COUNT OVINO FILTER ((OVINO.S6_P51D >= 0 AND OVINO.S6_P51D <= 99999)) AND NOT MISSING(OVINO.S6_P51D) AND NOT NOTAPPLICABLE(OVINO.S6_P51D) AND OVINO.S6_P51D = 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V45
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ovino_s6_p51d_species_total_zero.csv" UTF8
