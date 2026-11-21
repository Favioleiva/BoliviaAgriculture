RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R116 AS COUNT INFRAGRI FILTER INFRAGRI.S5_38_1C = 1954 TYPE INTEGER
DEFINE MUNIC.V116 AS COUNT UPA FILTER UPA.R116 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V116
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_infragri_s5_38_1c_c0004_holdings.csv" UTF8
