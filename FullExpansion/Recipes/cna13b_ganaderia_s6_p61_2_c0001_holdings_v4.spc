RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R138 AS COUNT GANADERIA FILTER GANADERIA.S6_P61_2 = 2 TYPE INTEGER
DEFINE MUNIC.V138 AS COUNT UPA FILTER UPA.R138 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V138
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ganaderia_s6_p61_2_c0001_holdings.csv" UTF8
