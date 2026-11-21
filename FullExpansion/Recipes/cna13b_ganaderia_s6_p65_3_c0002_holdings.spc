RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R26 AS COUNT GANADERIA FILTER GANADERIA.S6_P65_3 = 9 TYPE INTEGER
DEFINE MUNIC.V26 AS COUNT UPA FILTER UPA.R26 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V26
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ganaderia_s6_p65_3_c0002_holdings.csv" UTF8
