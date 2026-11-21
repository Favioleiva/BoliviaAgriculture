RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R44 AS COUNT APOCRED FILTER APOCRED.S11_P111_3 = 2 TYPE INTEGER
DEFINE MUNIC.V44 AS COUNT UPA FILTER UPA.R44 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V44
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_apocred_s11_p111_3_c0001_holdings.csv" UTF8
