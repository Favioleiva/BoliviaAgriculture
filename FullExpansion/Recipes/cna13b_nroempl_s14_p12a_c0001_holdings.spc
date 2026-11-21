RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R156 AS COUNT NROEMPL FILTER NROEMPL.S14_P12A = 2 TYPE INTEGER
DEFINE MUNIC.V156 AS COUNT UPA FILTER UPA.R156 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V156
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_nroempl_s14_p12a_c0001_holdings.csv" UTF8
