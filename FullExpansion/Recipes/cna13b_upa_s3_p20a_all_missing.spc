RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V135 AS COUNT UPA FILTER MISSING(UPA.S3_P20A) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V135
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_upa_s3_p20a_all_missing.csv" UTF8
