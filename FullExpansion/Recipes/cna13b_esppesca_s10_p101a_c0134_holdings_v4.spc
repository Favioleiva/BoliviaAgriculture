RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R30 AS COUNT ESPPESCA FILTER ESPPESCA.S10_P101A = "041213400" TYPE INTEGER
DEFINE MUNIC.V30 AS COUNT UPA FILTER UPA.R30 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V30
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_esppesca_s10_p101a_c0134_holdings.csv" UTF8
