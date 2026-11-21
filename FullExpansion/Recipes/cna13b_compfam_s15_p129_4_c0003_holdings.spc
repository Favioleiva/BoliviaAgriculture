RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R46 AS COUNT COMPFAM FILTER COMPFAM.S15_P129_4 = 3 TYPE INTEGER
DEFINE MUNIC.V46 AS COUNT UPA FILTER UPA.R46 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V46
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_compfam_s15_p129_4_c0003_holdings.csv" UTF8
