RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V148 AS COUNT LLAMA FILTER (LLAMA.S6_P63A = 8) AND NOTAPPLICABLE(LLAMA.S6_P63E) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V148
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_llama_s6_p63e_c0004_not_applicable.csv" UTF8
