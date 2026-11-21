RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R88 AS COUNT MAQAGRI FILTER MAQAGRI.S5_P39C = 1977 TYPE INTEGER
DEFINE MUNIC.V88 AS COUNT UPA FILTER UPA.R88 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V88
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maqagri_s5_p39c_c0025_holdings.csv" UTF8
