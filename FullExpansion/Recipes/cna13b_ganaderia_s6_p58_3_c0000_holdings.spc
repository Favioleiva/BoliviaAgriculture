RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R120 AS COUNT GANADERIA FILTER GANADERIA.S6_P58_3 = 1 TYPE INTEGER
DEFINE MUNIC.V120 AS COUNT UPA FILTER UPA.R120 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V120
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ganaderia_s6_p58_3_c0000_holdings.csv" UTF8
