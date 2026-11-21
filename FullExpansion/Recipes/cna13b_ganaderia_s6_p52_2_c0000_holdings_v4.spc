RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R70 AS COUNT GANADERIA FILTER GANADERIA.S6_P52_2 = 1 TYPE INTEGER
DEFINE MUNIC.V70 AS COUNT UPA FILTER UPA.R70 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V70
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ganaderia_s6_p52_2_c0000_holdings.csv" UTF8
