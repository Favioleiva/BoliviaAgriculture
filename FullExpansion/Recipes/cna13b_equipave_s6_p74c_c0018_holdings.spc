RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R122 AS COUNT EQUIPAVE FILTER EQUIPAVE.S6_P74C = 2003 TYPE INTEGER
DEFINE MUNIC.V122 AS COUNT UPA FILTER UPA.R122 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V122
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_equipave_s6_p74c_c0018_holdings.csv" UTF8
