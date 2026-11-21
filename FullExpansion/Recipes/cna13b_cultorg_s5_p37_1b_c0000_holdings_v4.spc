RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R92 AS COUNT CULTORG FILTER CULTORG.S5_P37_1B = 1 TYPE INTEGER
DEFINE MUNIC.V92 AS COUNT UPA FILTER UPA.R92 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V92
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultorg_s5_p37_1b_c0000_holdings.csv" UTF8
