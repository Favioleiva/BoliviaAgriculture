RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R76 AS COUNT INFRGAN FILTER INFRGAN.S7_P86B = 1994 TYPE INTEGER
DEFINE MUNIC.V76 AS COUNT UPA FILTER UPA.R76 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V76
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_infrgan_s7_p86b_c0009_holdings.csv" UTF8
