RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R34 AS COUNT CAZAPEZCA FILTER CAZAPEZCA.S10_P105_1 = 2 TYPE INTEGER
DEFINE MUNIC.V34 AS COUNT UPA FILTER UPA.R34 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V34
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cazapezca_s10_p105_1_c0001_holdings.csv" UTF8
