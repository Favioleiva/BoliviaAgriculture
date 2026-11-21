RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V51 AS COUNT ESPCRIA FILTER ESPCRIA.S10_P104B = "041191500" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V51
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espcria_s10_p104b_c0022_records.csv" UTF8
