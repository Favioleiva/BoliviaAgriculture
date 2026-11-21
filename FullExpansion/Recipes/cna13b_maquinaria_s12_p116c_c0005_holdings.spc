RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R84 AS COUNT MAQUINARIA FILTER MAQUINARIA.S12_P116C = 1958 TYPE INTEGER
DEFINE MUNIC.V84 AS COUNT UPA FILTER UPA.R84 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V84
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maquinaria_s12_p116c_c0005_holdings.csv" UTF8
