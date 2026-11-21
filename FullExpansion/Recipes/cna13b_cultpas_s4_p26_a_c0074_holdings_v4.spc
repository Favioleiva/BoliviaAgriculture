RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R82 AS COUNT CULTPAS FILTER CULTPAS.S4_P26_A = "01919079" TYPE INTEGER
DEFINE MUNIC.V82 AS COUNT UPA FILTER UPA.R82 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V82
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultpas_s4_p26_a_c0074_holdings.csv" UTF8
