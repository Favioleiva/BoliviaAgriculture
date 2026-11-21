RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V60 AS COUNT LLAMA FILTER (LLAMA.S6_P63A = 9) AND NOTAPPLICABLE(LLAMA.S6_P63C) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V60
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_llama_s6_p63c_c0005_not_applicable.csv" UTF8
