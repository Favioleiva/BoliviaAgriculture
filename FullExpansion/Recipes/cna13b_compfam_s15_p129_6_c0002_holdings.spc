RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R112 AS COUNT COMPFAM FILTER COMPFAM.S15_P129_6 = 9 TYPE INTEGER
DEFINE MUNIC.V112 AS COUNT UPA FILTER UPA.R112 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V112
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_compfam_s15_p129_6_c0002_holdings.csv" UTF8
