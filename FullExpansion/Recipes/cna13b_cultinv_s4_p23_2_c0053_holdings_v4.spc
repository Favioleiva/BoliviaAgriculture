RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R138 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01594000" TYPE INTEGER
DEFINE MUNIC.V138 AS COUNT UPA FILTER UPA.R138 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V138
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultinv_s4_p23_2_c0053_holdings.csv" UTF8
