RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE MUNIC.A23 AS COUNT UPA TYPE INTEGER
DEFINE MUNIC.C23 AS COUNT UPA FILTER ((UPA.S3_P22_4 >= 1 AND UPA.S3_P22_4 <= 2) OR (UPA.S3_P22_4 = 9)) TYPE INTEGER
DEFINE MUNIC.V23 AS MUNIC.A23 - MUNIC.C23 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V23
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_upa_s3_p22_4_unclassified_native_records_v2.csv" UTF8
