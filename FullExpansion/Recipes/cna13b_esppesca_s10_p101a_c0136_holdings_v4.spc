RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R34 AS COUNT ESPPESCA FILTER ESPPESCA.S10_P101A = "041213600" TYPE INTEGER
DEFINE MUNIC.V34 AS COUNT UPA FILTER UPA.R34 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V34
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_esppesca_s10_p101a_c0136_holdings.csv" UTF8
