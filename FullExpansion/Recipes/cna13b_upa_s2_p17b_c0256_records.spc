RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V45 AS COUNT UPA FILTER UPA.S2_P17B = "070201" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V45
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_upa_s2_p17b_c0256_records.csv" UTF8
