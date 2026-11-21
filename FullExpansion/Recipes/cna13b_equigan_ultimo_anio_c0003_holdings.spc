RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R100 AS COUNT EQUIGAN FILTER EQUIGAN.ULTIMO_ANIO = 1989 TYPE INTEGER
DEFINE MUNIC.V100 AS COUNT UPA FILTER UPA.R100 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V100
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_equigan_ultimo_anio_c0003_holdings.csv" UTF8
