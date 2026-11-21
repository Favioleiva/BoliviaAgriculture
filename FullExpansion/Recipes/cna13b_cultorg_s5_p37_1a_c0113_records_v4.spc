RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V119 AS COUNT CULTORG FILTER CULTORG.S5_P37_1A = "0139005" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V119
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultorg_s5_p37_1a_c0113_records.csv" UTF8
