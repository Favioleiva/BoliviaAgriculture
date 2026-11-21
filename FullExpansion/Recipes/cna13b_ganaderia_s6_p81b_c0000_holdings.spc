RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R130 AS COUNT GANADERIA FILTER GANADERIA.S6_P81B = "Kg" TYPE INTEGER
DEFINE MUNIC.V130 AS COUNT UPA FILTER UPA.R130 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V130
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ganaderia_s6_p81b_c0000_holdings.csv" UTF8
