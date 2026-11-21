RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V34 AS COUNT OVINO FILTER ((OVINO.S6_P51C >= 0 AND OVINO.S6_P51C <= 99999)) AND NOT MISSING(OVINO.S6_P51C) AND NOT NOTAPPLICABLE(OVINO.S6_P51C) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V34
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ovino_s6_p51c_species_total_valid.csv" UTF8
