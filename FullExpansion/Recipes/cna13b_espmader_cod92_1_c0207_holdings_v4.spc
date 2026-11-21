RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R122 AS COUNT ESPMADER FILTER ESPMADER.COD92_1 = "0312218" TYPE INTEGER
DEFINE MUNIC.V122 AS COUNT UPA FILTER UPA.R122 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V122
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espmader_cod92_1_c0207_holdings.csv" UTF8
