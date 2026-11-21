RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT

DEFINE UPA.R154 AS COUNT CULTOTR FILTER CULTOTR.S4_P27_D = "07000010" TYPE INTEGER
DEFINE MUNIC.V154 AS COUNT UPA FILTER UPA.R154 > 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V154
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultotr_s4_p27_d_c0000_holdings.csv" UTF8
