RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R148 AS COUNT EQUIPAVE FILTER EQUIPAVE.S6_P74D = 1986 TYPE INTEGER
DEFINE MUNIC.V148 AS COUNT UPA FILTER UPA.R148 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V148
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_equipave_s6_p74d_c0001_holdings.csv" UTF8
