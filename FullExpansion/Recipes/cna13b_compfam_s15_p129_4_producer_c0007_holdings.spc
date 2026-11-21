RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R86 AS COUNT COMPFAM FILTER COMPFAM.S15_P129_1 = 1 AND COMPFAM.S15_P129_4 = 7 TYPE INTEGER
DEFINE MUNIC.V86 AS COUNT UPA FILTER UPA.R86 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V86
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_compfam_s15_p129_4_producer_c0007_holdings.csv" UTF8
