RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R6 AS COUNT ENERGIA FILTER ENERGIA.S13_P117_1 = 9 TYPE INTEGER
DEFINE MUNIC.V6 AS COUNT UPA FILTER UPA.R6 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V6
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_energia_s13_p117_1_c0002_holdings.csv" UTF8
