RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R64 AS COUNT MAQUINARIA FILTER MAQUINARIA.S12_P116B = 2009 TYPE INTEGER
DEFINE MUNIC.V64 AS COUNT UPA FILTER UPA.R64 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V64
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maquinaria_s12_p116b_c0056_holdings.csv" UTF8
