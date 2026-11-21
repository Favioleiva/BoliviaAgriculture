RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R34 AS COUNT PRACAGRI FILTER PRACAGRI.S5_P34 = 2 TYPE INTEGER
DEFINE MUNIC.V34 AS COUNT UPA FILTER UPA.R34 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V34
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_pracagri_s5_p34_c0001_holdings.csv" UTF8
