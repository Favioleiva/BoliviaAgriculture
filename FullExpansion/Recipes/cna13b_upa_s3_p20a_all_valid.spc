RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V134 AS COUNT UPA FILTER ((UPA.S3_P20A >= 0 AND UPA.S3_P20A <= 99)) AND NOT MISSING(UPA.S3_P20A) AND NOT NOTAPPLICABLE(UPA.S3_P20A) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V134
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_upa_s3_p20a_all_valid.csv" UTF8
