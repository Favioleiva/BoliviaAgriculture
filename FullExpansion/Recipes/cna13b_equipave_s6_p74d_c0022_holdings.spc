RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R30 AS COUNT EQUIPAVE FILTER EQUIPAVE.S6_P74D = 2008 TYPE INTEGER
DEFINE MUNIC.V30 AS COUNT UPA FILTER UPA.R30 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V30
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_equipave_s6_p74d_c0022_holdings.csv" UTF8
