RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R28 AS COUNT CONSTRUCCION FILTER CONSTRUCCION.S12_P115B = 1963 TYPE INTEGER
DEFINE MUNIC.V28 AS COUNT UPA FILTER UPA.R28 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V28
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_construccion_s12_p115b_c0011_holdings.csv" UTF8
