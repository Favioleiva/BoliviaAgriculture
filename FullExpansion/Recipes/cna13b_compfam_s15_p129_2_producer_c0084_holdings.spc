RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R50 AS COUNT COMPFAM FILTER COMPFAM.S15_P129_1 = 1 AND COMPFAM.S15_P129_2 = 92 TYPE INTEGER
DEFINE MUNIC.V50 AS COUNT UPA FILTER UPA.R50 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V50
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_compfam_s15_p129_2_producer_c0084_holdings.csv" UTF8
