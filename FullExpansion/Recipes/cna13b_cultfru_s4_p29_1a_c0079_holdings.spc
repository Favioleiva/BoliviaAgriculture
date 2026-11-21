RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R160 AS COUNT CULTFRU FILTER CULTFRU.S4_P29_1A = "0139010" TYPE INTEGER
DEFINE MUNIC.V160 AS COUNT UPA FILTER UPA.R160 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V160
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultfru_s4_p29_1a_c0079_holdings.csv" UTF8
