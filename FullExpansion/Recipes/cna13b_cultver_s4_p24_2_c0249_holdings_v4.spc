RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R78 AS COUNT CULTVER FILTER CULTVER.S4_P24_2 = "01961022" TYPE INTEGER
DEFINE MUNIC.V78 AS COUNT UPA FILTER UPA.R78 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V78
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultver_s4_p24_2_c0249_holdings.csv" UTF8
