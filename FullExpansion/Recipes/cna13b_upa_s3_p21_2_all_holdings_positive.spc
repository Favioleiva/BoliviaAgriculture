RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V4 AS COUNT UPA FILTER ((UPA.S3_P21_2 >= 0.000000 AND UPA.S3_P21_2 <= 99999999999.000000)) AND NOT MISSING(UPA.S3_P21_2) AND NOT NOTAPPLICABLE(UPA.S3_P21_2) AND UPA.S3_P21_2 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V4
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_upa_s3_p21_2_all_holdings_positive.csv" UTF8
