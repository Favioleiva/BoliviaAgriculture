RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R134 AS COUNT ESPCAZA FILTER ESPCAZA.S10_P98A = "050204600" TYPE INTEGER
DEFINE MUNIC.V134 AS COUNT UPA FILTER UPA.R134 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V134
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espcaza_s10_p98a_c0125_holdings.csv" UTF8
