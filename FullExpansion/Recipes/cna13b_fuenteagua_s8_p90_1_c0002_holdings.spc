RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R28 AS COUNT FUENTEAGUA FILTER FUENTEAGUA.S8_P90_1 = 9 TYPE INTEGER
DEFINE MUNIC.V28 AS COUNT UPA FILTER UPA.R28 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V28
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_fuenteagua_s8_p90_1_c0002_holdings.csv" UTF8
