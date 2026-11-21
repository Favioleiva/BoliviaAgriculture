RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R72 AS COUNT SANIDAD FILTER SANIDAD.S7_P85_3 = 9 TYPE INTEGER
DEFINE MUNIC.V72 AS COUNT UPA FILTER UPA.R72 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V72
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_sanidad_s7_p85_3_c0002_holdings.csv" UTF8
