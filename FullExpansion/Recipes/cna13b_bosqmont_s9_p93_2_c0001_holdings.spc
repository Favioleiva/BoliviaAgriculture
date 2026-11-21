RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R14 AS COUNT BOSQMONT FILTER BOSQMONT.S9_P93_2 = 2 TYPE INTEGER
DEFINE MUNIC.V14 AS COUNT UPA FILTER UPA.R14 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V14
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_bosqmont_s9_p93_2_c0001_holdings.csv" UTF8
