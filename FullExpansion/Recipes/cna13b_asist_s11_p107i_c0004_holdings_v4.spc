RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R96 AS COUNT ASIST FILTER ASIST.S11_P107I = 4 TYPE INTEGER
DEFINE MUNIC.V96 AS COUNT UPA FILTER UPA.R96 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V96
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_asist_s11_p107i_c0004_holdings.csv" UTF8
