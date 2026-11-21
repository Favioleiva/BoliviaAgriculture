RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE MUNIC.A22 AS COUNT UPA TYPE INTEGER
DEFINE MUNIC.C22 AS COUNT UPA FILTER ((UPA.S3_P22_3 = 1) OR (UPA.S3_P22_3 = 2) OR (UPA.S3_P22_3 = 9)) TYPE INTEGER
DEFINE MUNIC.V22 AS MUNIC.A22 - MUNIC.C22 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V22
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_upa_s3_p22_3_unclassified_native_holdings.csv" UTF8
