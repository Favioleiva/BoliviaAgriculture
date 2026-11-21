RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R26 AS COUNT CONSTRUCCION FILTER CONSTRUCCION.S12_P115B = 1962 TYPE INTEGER
DEFINE MUNIC.V26 AS COUNT UPA FILTER UPA.R26 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V26
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_construccion_s12_p115b_c0010_holdings.csv" UTF8
