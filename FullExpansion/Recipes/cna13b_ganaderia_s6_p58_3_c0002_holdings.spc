RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R124 AS COUNT GANADERIA FILTER GANADERIA.S6_P58_3 = 9 TYPE INTEGER
DEFINE MUNIC.V124 AS COUNT UPA FILTER UPA.R124 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V124
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ganaderia_s6_p58_3_c0002_holdings.csv" UTF8
