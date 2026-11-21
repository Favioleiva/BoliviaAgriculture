RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V84 AS COUNT UPA FILTER UPA.S2_P17B = "022001" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V84
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_upa_s2_p17b_c0115_holdings.csv" UTF8
