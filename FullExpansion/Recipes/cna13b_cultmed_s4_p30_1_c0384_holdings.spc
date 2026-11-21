RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R140 AS COUNT CULTMED FILTER CULTMED.S4_P30_1 = "0312049" TYPE INTEGER
DEFINE MUNIC.V140 AS COUNT UPA FILTER UPA.R140 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V140
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultmed_s4_p30_1_c0384_holdings.csv" UTF8
