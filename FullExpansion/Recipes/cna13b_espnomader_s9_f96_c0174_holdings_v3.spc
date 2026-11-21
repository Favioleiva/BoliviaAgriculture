RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R54 AS COUNT ESPNOMADER FILTER TRIM(ESPNOMADER.S9_F96) = "339999" TYPE INTEGER
DEFINE MUNIC.V54 AS COUNT UPA FILTER UPA.R54 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V54
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espnomader_s9_f96_c0174_holdings.csv" UTF8
