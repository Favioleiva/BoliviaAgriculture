RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R24 AS COUNT MAQUINARIA FILTER MAQUINARIA.S12_P116C = 2008 TYPE INTEGER
DEFINE MUNIC.V24 AS COUNT UPA FILTER UPA.R24 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V24
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maquinaria_s12_p116c_c0055_holdings.csv" UTF8
