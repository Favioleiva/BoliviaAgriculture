RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R150 AS COUNT ESPPESCA FILTER ESPPESCA.S10_P101C = "Ene" TYPE INTEGER
DEFINE MUNIC.V150 AS COUNT UPA FILTER UPA.R150 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V150
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_esppesca_s10_p101c_c0004_holdings.csv" UTF8
