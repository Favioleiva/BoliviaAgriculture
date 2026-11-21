RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R78 AS COUNT ENERGIA FILTER ENERGIA.S13_P122 = 2 TYPE INTEGER
DEFINE MUNIC.V78 AS COUNT UPA FILTER UPA.R78 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V78
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_energia_s13_p122_c0001_holdings.csv" UTF8
