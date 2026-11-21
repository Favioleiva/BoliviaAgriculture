RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R62 AS COUNT MAQAGRI FILTER MAQAGRI.S5_P39C = 1964 TYPE INTEGER
DEFINE MUNIC.V62 AS COUNT UPA FILTER UPA.R62 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V62
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maqagri_s5_p39c_c0012_holdings.csv" UTF8
