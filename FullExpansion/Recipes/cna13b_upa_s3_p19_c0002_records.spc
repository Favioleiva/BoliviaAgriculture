RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V67 AS COUNT UPA FILTER UPA.S3_P19 = 3 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V67
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_upa_s3_p19_c0002_records.csv" UTF8
