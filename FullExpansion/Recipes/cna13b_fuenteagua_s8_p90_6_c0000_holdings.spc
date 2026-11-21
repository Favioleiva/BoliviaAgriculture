RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R54 AS COUNT FUENTEAGUA FILTER FUENTEAGUA.S8_P90_6 = 1 TYPE INTEGER
DEFINE MUNIC.V54 AS COUNT UPA FILTER UPA.R54 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V54
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_fuenteagua_s8_p90_6_c0000_holdings.csv" UTF8
