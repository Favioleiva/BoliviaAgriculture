RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R74 AS COUNT GANADERIA FILTER GANADERIA.S6_P52_2 = 9 TYPE INTEGER
DEFINE MUNIC.V74 AS COUNT UPA FILTER UPA.R74 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V74
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ganaderia_s6_p52_2_c0002_holdings.csv" UTF8
