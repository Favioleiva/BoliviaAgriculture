RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R48 AS COUNT ENERGIA FILTER ENERGIA.S13_P117_8 = 9 TYPE INTEGER
DEFINE MUNIC.V48 AS COUNT UPA FILTER UPA.R48 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V48
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_energia_s13_p117_8_c0002_holdings.csv" UTF8
