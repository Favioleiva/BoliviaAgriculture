RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R120 AS COUNT INFRAGRI FILTER INFRAGRI.S5_38_1C = 1956 TYPE INTEGER
DEFINE MUNIC.V120 AS COUNT UPA FILTER UPA.R120 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V120
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_infragri_s5_38_1c_c0006_holdings.csv" UTF8
