RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R12 AS COUNT CULTFOR FILTER CULTFOR.S4_P27_A = "03120124" TYPE INTEGER
DEFINE MUNIC.V12 AS COUNT UPA FILTER UPA.R12 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V12
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultfor_s4_p27_a_c0109_holdings.csv" UTF8
