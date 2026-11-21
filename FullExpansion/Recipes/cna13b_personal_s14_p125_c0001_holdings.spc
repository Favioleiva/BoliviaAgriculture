RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R148 AS COUNT PERSONAL FILTER PERSONAL.S14_P125 = 2 TYPE INTEGER
DEFINE MUNIC.V148 AS COUNT UPA FILTER UPA.R148 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V148
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_personal_s14_p125_c0001_holdings.csv" UTF8
