RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R124 AS COUNT EQUIGAN FILTER EQUIGAN.ULTIMO_ANIO = 2001 TYPE INTEGER
DEFINE MUNIC.V124 AS COUNT UPA FILTER UPA.R124 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V124
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_equigan_ultimo_anio_c0015_holdings.csv" UTF8
