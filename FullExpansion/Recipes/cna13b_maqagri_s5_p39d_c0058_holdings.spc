RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R120 AS COUNT MAQAGRI FILTER MAQAGRI.S5_P39D = 2010 TYPE INTEGER
DEFINE MUNIC.V120 AS COUNT UPA FILTER UPA.R120 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V120
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maqagri_s5_p39d_c0058_holdings.csv" UTF8
