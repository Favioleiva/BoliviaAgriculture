RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R68 AS COUNT CONSTRUCCION FILTER CONSTRUCCION.S12_P115B = 1983 TYPE INTEGER
DEFINE MUNIC.V68 AS COUNT UPA FILTER UPA.R68 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V68
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_construccion_s12_p115b_c0031_holdings.csv" UTF8
