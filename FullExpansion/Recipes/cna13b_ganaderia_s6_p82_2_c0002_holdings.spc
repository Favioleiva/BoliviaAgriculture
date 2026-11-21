RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R142 AS COUNT GANADERIA FILTER GANADERIA.S6_P82_2 = 9 TYPE INTEGER
DEFINE MUNIC.V142 AS COUNT UPA FILTER UPA.R142 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V142
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ganaderia_s6_p82_2_c0002_holdings.csv" UTF8
