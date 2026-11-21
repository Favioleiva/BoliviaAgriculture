RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R132 AS COUNT CULTSEM FILTER CULTSEM.S4_P25_A = "01802001" TYPE INTEGER
DEFINE MUNIC.V132 AS COUNT UPA FILTER UPA.R132 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V132
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultsem_s4_p25_a_c0139_holdings.csv" UTF8
