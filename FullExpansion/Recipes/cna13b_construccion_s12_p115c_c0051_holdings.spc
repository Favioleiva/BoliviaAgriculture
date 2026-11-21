RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R74 AS COUNT CONSTRUCCION FILTER CONSTRUCCION.S12_P115C = 2003 TYPE INTEGER
DEFINE MUNIC.V74 AS COUNT UPA FILTER UPA.R74 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V74
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_construccion_s12_p115c_c0051_holdings.csv" UTF8
