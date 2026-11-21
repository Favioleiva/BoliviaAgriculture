RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V89 AS COUNT ALPACA FILTER ALPACA.S6_P67A = 9 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V89
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_alpaca_s6_p67c_c0005_records.csv" UTF8
