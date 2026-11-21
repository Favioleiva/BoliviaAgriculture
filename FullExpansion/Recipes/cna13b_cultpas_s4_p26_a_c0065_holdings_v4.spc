RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R64 AS COUNT CULTPAS FILTER CULTPAS.S4_P26_A = "01919068" TYPE INTEGER
DEFINE MUNIC.V64 AS COUNT UPA FILTER UPA.R64 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V64
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultpas_s4_p26_a_c0065_holdings.csv" UTF8
