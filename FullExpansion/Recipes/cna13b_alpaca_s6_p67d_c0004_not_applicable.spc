RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V132 AS COUNT ALPACA FILTER (ALPACA.S6_P67A = 8) AND NOTAPPLICABLE(ALPACA.S6_P67D) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V132
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_alpaca_s6_p67d_c0004_not_applicable.csv" UTF8
