RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R160 AS COUNT ESPNOMADER FILTER ESPNOMADER.S9_F96 = "0323226" TYPE INTEGER
DEFINE MUNIC.V160 AS COUNT UPA FILTER UPA.R160 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V160
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espnomader_s9_f96_c0067_holdings.csv" UTF8
