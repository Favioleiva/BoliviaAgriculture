RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R20 AS COUNT BOSQMONT FILTER BOSQMONT.S9_P94 = 2 TYPE INTEGER
DEFINE MUNIC.V20 AS COUNT UPA FILTER UPA.R20 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V20
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_bosqmont_s9_p94_c0001_holdings.csv" UTF8
