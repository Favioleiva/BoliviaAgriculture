RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V109 AS COUNT CULTORG FILTER CULTORG.S5_P37_1A = "0137100" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V109
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultorg_s5_p37_1a_c0108_records.csv" UTF8
