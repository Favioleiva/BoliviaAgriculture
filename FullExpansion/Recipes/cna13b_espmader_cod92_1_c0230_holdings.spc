RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R8 AS COUNT ESPMADER FILTER ESPMADER.COD92_1 = "0312251" TYPE INTEGER
DEFINE MUNIC.V8 AS COUNT UPA FILTER UPA.R8 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V8
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espmader_cod92_1_c0230_holdings.csv" UTF8
