RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R38 AS COUNT SANIDAD FILTER SANIDAD.S7_P83_6 = 1 TYPE INTEGER
DEFINE MUNIC.V38 AS COUNT UPA FILTER UPA.R38 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V38
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_sanidad_s7_p83_6_c0000_holdings.csv" UTF8
