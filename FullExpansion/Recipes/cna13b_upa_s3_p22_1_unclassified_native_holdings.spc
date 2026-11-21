RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE MUNIC.A18 AS COUNT UPA TYPE INTEGER
DEFINE MUNIC.C18 AS COUNT UPA FILTER ((UPA.S3_P22_1 = 1) OR (UPA.S3_P22_1 = 2) OR (UPA.S3_P22_1 = 9)) TYPE INTEGER
DEFINE MUNIC.V18 AS MUNIC.A18 - MUNIC.C18 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V18
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_upa_s3_p22_1_unclassified_native_holdings.csv" UTF8
