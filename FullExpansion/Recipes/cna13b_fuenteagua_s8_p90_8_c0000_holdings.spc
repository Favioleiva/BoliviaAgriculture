RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R66 AS COUNT FUENTEAGUA FILTER FUENTEAGUA.S8_P90_8 = 1 TYPE INTEGER
DEFINE MUNIC.V66 AS COUNT UPA FILTER UPA.R66 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V66
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_fuenteagua_s8_p90_8_c0000_holdings.csv" UTF8
