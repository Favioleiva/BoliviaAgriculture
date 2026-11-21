RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V29 AS COUNT OVINO FILTER ((OVINO.S6_P51B >= 0 AND OVINO.S6_P51B <= 99999)) AND NOT MISSING(OVINO.S6_P51B) AND NOT NOTAPPLICABLE(OVINO.S6_P51B) AND OVINO.S6_P51B = 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V29
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ovino_s6_p51b_species_total_zero.csv" UTF8
