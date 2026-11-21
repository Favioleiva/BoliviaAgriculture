RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V10 AS COUNT ALPACA FILTER ((ALPACA.S6_P67B >= 0 AND ALPACA.S6_P67B <= 9999)) AND NOT MISSING(ALPACA.S6_P67B) AND NOT NOTAPPLICABLE(ALPACA.S6_P67B) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V10
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_alpaca_s6_p67b_species_total_valid.csv" UTF8
