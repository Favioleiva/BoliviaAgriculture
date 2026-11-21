RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R148 AS COUNT GANADERIA FILTER GANADERIA.S6_P62 = 1 TYPE INTEGER
DEFINE MUNIC.V148 AS COUNT UPA FILTER UPA.R148 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V148
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ganaderia_s6_p62_c0000_holdings.csv" UTF8
