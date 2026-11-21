RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R6 AS COUNT SANIDAD FILTER SANIDAD.S7_P83_11 = 9 TYPE INTEGER
DEFINE MUNIC.V6 AS COUNT UPA FILTER UPA.R6 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V6
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_sanidad_s7_p83_11_c0002_holdings.csv" UTF8
