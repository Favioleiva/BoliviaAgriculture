RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R132 AS COUNT INFRGAN FILTER INFRGAN.S7_P86C = 1992 TYPE INTEGER
DEFINE MUNIC.V132 AS COUNT UPA FILTER UPA.R132 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V132
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_infrgan_s7_p86c_c0007_holdings.csv" UTF8
