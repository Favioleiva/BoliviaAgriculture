RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R94 AS COUNT AVESC FILTER AVESC.S6_P76_2 = 3 TYPE INTEGER
DEFINE MUNIC.V94 AS COUNT UPA FILTER UPA.R94 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V94
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_avesc_s6_p76_2_c0002_holdings.csv" UTF8
