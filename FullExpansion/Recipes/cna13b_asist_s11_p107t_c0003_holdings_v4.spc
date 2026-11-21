RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R84 AS COUNT ASIST FILTER ASIST.S11_P107T = 4 TYPE INTEGER
DEFINE MUNIC.V84 AS COUNT UPA FILTER UPA.R84 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V84
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_asist_s11_p107t_c0003_holdings.csv" UTF8
