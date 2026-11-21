RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE MUNIC.A19 AS COUNT UPA TYPE INTEGER
DEFINE MUNIC.C19 AS COUNT UPA FILTER ((UPA.S3_P22_2 = 1) OR (UPA.S3_P22_2 = 2) OR (UPA.S3_P22_2 = 9)) TYPE INTEGER
DEFINE MUNIC.V19 AS MUNIC.A19 - MUNIC.C19 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V19
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_upa_s3_p22_2_unclassified_native_records.csv" UTF8
