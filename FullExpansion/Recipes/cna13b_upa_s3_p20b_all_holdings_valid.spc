RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V147 AS COUNT UPA FILTER ((UPA.S3_P20B >= 0.000000 AND UPA.S3_P20B <= 99999999999.000000)) AND NOT MISSING(UPA.S3_P20B) AND NOT NOTAPPLICABLE(UPA.S3_P20B) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V147
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_upa_s3_p20b_all_holdings_valid.csv" UTF8
