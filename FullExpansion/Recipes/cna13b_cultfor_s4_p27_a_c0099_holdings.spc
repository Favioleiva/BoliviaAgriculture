RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R152 AS COUNT CULTFOR FILTER CULTFOR.S4_P27_A = "03120113" TYPE INTEGER
DEFINE MUNIC.V152 AS COUNT UPA FILTER UPA.R152 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V152
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultfor_s4_p27_a_c0099_holdings.csv" UTF8
