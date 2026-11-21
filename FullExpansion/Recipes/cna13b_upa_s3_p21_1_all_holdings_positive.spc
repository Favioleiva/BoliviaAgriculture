RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V156 AS COUNT UPA FILTER ((UPA.S3_P21_1 >= 0.000000 AND UPA.S3_P21_1 <= 99999999999.000000)) AND NOT MISSING(UPA.S3_P21_1) AND NOT NOTAPPLICABLE(UPA.S3_P21_1) AND UPA.S3_P21_1 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V156
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_upa_s3_p21_1_all_holdings_positive.csv" UTF8
