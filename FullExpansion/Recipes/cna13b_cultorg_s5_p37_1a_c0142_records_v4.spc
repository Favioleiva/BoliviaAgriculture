RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V17 AS COUNT CULTORG FILTER CULTORG.S5_P37_1A = "0164000" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V17
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultorg_s5_p37_1a_c0142_records.csv" UTF8
