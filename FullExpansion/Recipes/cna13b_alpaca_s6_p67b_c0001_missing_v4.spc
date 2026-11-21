RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V11 AS COUNT ALPACA FILTER (ALPACA.S6_P67A = 4) AND MISSING(ALPACA.S6_P67B) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V11
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_alpaca_s6_p67b_c0001_missing.csv" UTF8
