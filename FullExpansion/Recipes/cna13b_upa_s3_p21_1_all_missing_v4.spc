RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V151 AS COUNT UPA FILTER MISSING(UPA.S3_P21_1) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V151
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_upa_s3_p21_1_all_missing.csv" UTF8
