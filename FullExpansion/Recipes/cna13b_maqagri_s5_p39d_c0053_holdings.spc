RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R110 AS COUNT MAQAGRI FILTER MAQAGRI.S5_P39D = 2005 TYPE INTEGER
DEFINE MUNIC.V110 AS COUNT UPA FILTER UPA.R110 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V110
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maqagri_s5_p39d_c0053_holdings.csv" UTF8
