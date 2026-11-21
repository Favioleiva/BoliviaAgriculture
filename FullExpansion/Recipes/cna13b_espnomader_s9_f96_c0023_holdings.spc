RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R72 AS COUNT ESPNOMADER FILTER ESPNOMADER.S9_F96 = "0323084" TYPE INTEGER
DEFINE MUNIC.V72 AS COUNT UPA FILTER UPA.R72 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V72
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espnomader_s9_f96_c0023_holdings.csv" UTF8
