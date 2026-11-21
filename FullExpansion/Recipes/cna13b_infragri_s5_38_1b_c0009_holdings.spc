RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R156 AS COUNT INFRAGRI FILTER INFRAGRI.S5_38_1B = 1959 TYPE INTEGER
DEFINE MUNIC.V156 AS COUNT UPA FILTER UPA.R156 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V156
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_infragri_s5_38_1b_c0009_holdings.csv" UTF8
