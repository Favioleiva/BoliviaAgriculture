RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V22 AS SUM ALPACA.S6_P67C FILTER ((ALPACA.S6_P67C >= 0 AND ALPACA.S6_P67C <= 9999)) AND NOT MISSING(ALPACA.S6_P67C) AND NOT NOTAPPLICABLE(ALPACA.S6_P67C) TYPE REAL DECIMALS 6
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V22
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_alpaca_s6_p67c_species_total_sum.csv" UTF8
