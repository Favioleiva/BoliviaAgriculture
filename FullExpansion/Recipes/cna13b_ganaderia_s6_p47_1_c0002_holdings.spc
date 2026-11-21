RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R42 AS COUNT GANADERIA FILTER GANADERIA.S6_P47_1 = 9 TYPE INTEGER
DEFINE MUNIC.V42 AS COUNT UPA FILTER UPA.R42 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V42
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ganaderia_s6_p47_1_c0002_holdings.csv" UTF8
