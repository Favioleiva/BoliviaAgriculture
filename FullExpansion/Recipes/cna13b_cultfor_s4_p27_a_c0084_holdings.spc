RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R122 AS COUNT CULTFOR FILTER CULTFOR.S4_P27_A = "03120089" TYPE INTEGER
DEFINE MUNIC.V122 AS COUNT UPA FILTER UPA.R122 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V122
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultfor_s4_p27_a_c0084_holdings.csv" UTF8
