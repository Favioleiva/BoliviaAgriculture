RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R82 AS COUNT GANADERIA FILTER GANADERIA.S6_P71_3 = 2 TYPE INTEGER
DEFINE MUNIC.V82 AS COUNT UPA FILTER UPA.R82 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V82
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ganaderia_s6_p71_3_c0001_holdings.csv" UTF8
