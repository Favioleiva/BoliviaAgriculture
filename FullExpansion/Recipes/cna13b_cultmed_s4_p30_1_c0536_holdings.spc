RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R124 AS COUNT CULTMED FILTER CULTMED.S4_P30_1 = "0323033" TYPE INTEGER
DEFINE MUNIC.V124 AS COUNT UPA FILTER UPA.R124 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V124
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultmed_s4_p30_1_c0536_holdings.csv" UTF8
