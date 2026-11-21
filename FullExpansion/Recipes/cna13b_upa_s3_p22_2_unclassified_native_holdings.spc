RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE MUNIC.A20 AS COUNT UPA TYPE INTEGER
DEFINE MUNIC.C20 AS COUNT UPA FILTER ((UPA.S3_P22_2 = 1) OR (UPA.S3_P22_2 = 2) OR (UPA.S3_P22_2 = 9)) TYPE INTEGER
DEFINE MUNIC.V20 AS MUNIC.A20 - MUNIC.C20 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V20
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_upa_s3_p22_2_unclassified_native_holdings.csv" UTF8
