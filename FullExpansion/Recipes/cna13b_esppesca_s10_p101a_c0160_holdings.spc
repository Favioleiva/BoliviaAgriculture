RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R82 AS COUNT ESPPESCA FILTER ESPPESCA.S10_P101A = "041216000" TYPE INTEGER
DEFINE MUNIC.V82 AS COUNT UPA FILTER UPA.R82 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V82
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_esppesca_s10_p101a_c0160_holdings.csv" UTF8
