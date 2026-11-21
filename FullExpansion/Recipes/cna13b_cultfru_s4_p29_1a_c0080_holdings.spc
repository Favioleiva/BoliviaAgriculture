RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R2 AS COUNT CULTFRU FILTER CULTFRU.S4_P29_1A = "0146000" TYPE INTEGER
DEFINE MUNIC.V2 AS COUNT UPA FILTER UPA.R2 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V2
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultfru_s4_p29_1a_c0080_holdings.csv" UTF8
