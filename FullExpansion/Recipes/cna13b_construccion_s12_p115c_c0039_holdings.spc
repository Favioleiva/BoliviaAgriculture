RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R50 AS COUNT CONSTRUCCION FILTER CONSTRUCCION.S12_P115C = 1991 TYPE INTEGER
DEFINE MUNIC.V50 AS COUNT UPA FILTER UPA.R50 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V50
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_construccion_s12_p115c_c0039_holdings.csv" UTF8
