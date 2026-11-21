RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R104 AS COUNT GANADERIA FILTER GANADERIA.S6_P77_2 = 2 TYPE INTEGER
DEFINE MUNIC.V104 AS COUNT UPA FILTER UPA.R104 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V104
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ganaderia_s6_p77_2_c0001_holdings.csv" UTF8
