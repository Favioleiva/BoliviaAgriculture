RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R98 AS COUNT CULTINV FILTER CULTINV.S4_P23_2 = "01242000" TYPE INTEGER
DEFINE MUNIC.V98 AS COUNT UPA FILTER UPA.R98 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V98
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultinv_s4_p23_2_c0033_holdings.csv" UTF8
