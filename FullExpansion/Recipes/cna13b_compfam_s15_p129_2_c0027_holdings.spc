RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R64 AS COUNT COMPFAM FILTER COMPFAM.S15_P129_2 = 35 TYPE INTEGER
DEFINE MUNIC.V64 AS COUNT UPA FILTER UPA.R64 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V64
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_compfam_s15_p129_2_c0027_holdings.csv" UTF8
