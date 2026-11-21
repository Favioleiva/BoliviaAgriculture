RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE MUNIC.A21 AS COUNT UPA TYPE INTEGER
DEFINE MUNIC.C21 AS COUNT UPA FILTER ((UPA.S3_P22_3 = 1) OR (UPA.S3_P22_3 = 2) OR (UPA.S3_P22_3 = 9)) TYPE INTEGER
DEFINE MUNIC.V21 AS MUNIC.A21 - MUNIC.C21 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V21
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_upa_s3_p22_3_unclassified_native_records.csv" UTF8
