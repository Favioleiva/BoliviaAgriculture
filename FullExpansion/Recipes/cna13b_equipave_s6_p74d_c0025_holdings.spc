RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R36 AS COUNT EQUIPAVE FILTER EQUIPAVE.S6_P74D = 2011 TYPE INTEGER
DEFINE MUNIC.V36 AS COUNT UPA FILTER UPA.R36 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V36
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_equipave_s6_p74d_c0025_holdings.csv" UTF8
