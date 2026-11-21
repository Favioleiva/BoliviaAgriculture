RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R52 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01319012" TYPE INTEGER
DEFINE MUNIC.V52 AS COUNT UPA FILTER UPA.R52 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V52
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultver_s4_p24_2_c0076_holdings.csv" UTF8
