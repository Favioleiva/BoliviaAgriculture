RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R108 AS COUNT EQUIGAN FILTER EQUIGAN.ULTIMO_ANIO = 1993 TYPE INTEGER
DEFINE MUNIC.V108 AS COUNT UPA FILTER UPA.R108 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V108
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_equigan_ultimo_anio_c0007_holdings.csv" UTF8
