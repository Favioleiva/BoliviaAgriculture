RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R134 AS COUNT MAQAGRI FILTER MAQAGRI.S5_P39C = 2000 TYPE INTEGER
DEFINE MUNIC.V134 AS COUNT UPA FILTER UPA.R134 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V134
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maqagri_s5_p39c_c0048_holdings.csv" UTF8
