RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R22 AS COUNT PORCINOC FILTER PORCINOC.S6_P57A = "1" TYPE INTEGER
DEFINE MUNIC.V22 AS COUNT UPA FILTER UPA.R22 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V22
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_porcinoc_s6_p57a_c0000_holdings.csv" UTF8
