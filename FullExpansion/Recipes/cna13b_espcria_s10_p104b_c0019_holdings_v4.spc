RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R46 AS COUNT ESPCRIA FILTER ESPCRIA.S10_P104B = "041191200" TYPE INTEGER
DEFINE MUNIC.V46 AS COUNT UPA FILTER UPA.R46 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V46
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espcria_s10_p104b_c0019_holdings.csv" UTF8
