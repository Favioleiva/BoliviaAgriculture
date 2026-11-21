RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R144 AS COUNT EQUIPAVE FILTER EQUIPAVE.S6_P74C = 9999 TYPE INTEGER
DEFINE MUNIC.V144 AS COUNT UPA FILTER UPA.R144 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V144
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_equipave_s6_p74c_c0029_holdings.csv" UTF8
