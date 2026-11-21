RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R114 AS COUNT MAQAGRI FILTER MAQAGRI.S5_P39C = 1990 TYPE INTEGER
DEFINE MUNIC.V114 AS COUNT UPA FILTER UPA.R114 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V114
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maqagri_s5_p39c_c0038_holdings.csv" UTF8
