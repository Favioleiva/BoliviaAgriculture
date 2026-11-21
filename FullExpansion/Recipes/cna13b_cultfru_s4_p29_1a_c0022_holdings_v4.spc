RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R46 AS COUNT CULTFRU FILTER CULTFRU.S4_P29_1A = "0131917" TYPE INTEGER
DEFINE MUNIC.V46 AS COUNT UPA FILTER UPA.R46 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V46
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultfru_s4_p29_1a_c0022_holdings.csv" UTF8
