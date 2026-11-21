RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V83 AS COUNT ALPACA FILTER (ALPACA.S6_P67A = 8) AND MISSING(ALPACA.S6_P67C) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V83
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_alpaca_s6_p67c_c0004_missing.csv" UTF8
