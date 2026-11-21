RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R40 AS COUNT APOCRED FILTER APOCRED.S11_P111_2 = 9 TYPE INTEGER
DEFINE MUNIC.V40 AS COUNT UPA FILTER UPA.R40 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V40
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_apocred_s11_p111_2_c0002_holdings.csv" UTF8
