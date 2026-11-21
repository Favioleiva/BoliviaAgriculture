RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R4 AS COUNT BOVINO FILTER BOVINO.S6_P41A = 11 TYPE INTEGER
DEFINE MUNIC.V4 AS COUNT UPA FILTER UPA.R4 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V4
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_bovino_s6_p41a_c0007_holdings.csv" UTF8
