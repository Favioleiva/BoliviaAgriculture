RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R60 AS COUNT ESPCAZA FILTER ESPCAZA.S10_P98C = "Ago" TYPE INTEGER
DEFINE MUNIC.V60 AS COUNT UPA FILTER UPA.R60 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V60
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espcaza_s10_p98c_c0002_holdings.csv" UTF8
