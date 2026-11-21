RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R48 AS COUNT ESPNOMADER FILTER ESPNOMADER.S9_F96 = "0323019" TYPE INTEGER
DEFINE MUNIC.V48 AS COUNT UPA FILTER UPA.R48 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V48
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espnomader_s9_f96_c0011_holdings.csv" UTF8
