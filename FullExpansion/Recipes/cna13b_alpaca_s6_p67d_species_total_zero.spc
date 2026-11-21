RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V29 AS COUNT ALPACA FILTER ((ALPACA.S6_P67D >= 0 AND ALPACA.S6_P67D <= 9999)) AND NOT MISSING(ALPACA.S6_P67D) AND NOT NOTAPPLICABLE(ALPACA.S6_P67D) AND ALPACA.S6_P67D = 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V29
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_alpaca_s6_p67d_species_total_zero.csv" UTF8
