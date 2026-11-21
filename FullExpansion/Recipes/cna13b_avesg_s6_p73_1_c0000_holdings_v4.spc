RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R70 AS COUNT AVESG FILTER AVESG.S6_P73_1 = "01" TYPE INTEGER
DEFINE MUNIC.V70 AS COUNT UPA FILTER UPA.R70 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V70
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_avesg_s6_p73_1_c0000_holdings.csv" UTF8
