RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R70 AS COUNT CULTORG FILTER CULTORG.S5_P37_1A = "0196161" TYPE INTEGER
DEFINE MUNIC.V70 AS COUNT UPA FILTER UPA.R70 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V70
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultorg_s5_p37_1a_c0248_holdings.csv" UTF8
