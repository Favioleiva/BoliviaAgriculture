RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R32 AS COUNT CULTMED FILTER CULTMED.S4_P30_1 = "0132700" TYPE INTEGER
DEFINE MUNIC.V32 AS COUNT UPA FILTER UPA.R32 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V32
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultmed_s4_p30_1_c0090_holdings.csv" UTF8
