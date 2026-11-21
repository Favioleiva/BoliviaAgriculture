RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V157 AS COUNT LLAMA FILTER ((LLAMA.S6_P63D >= 0 AND LLAMA.S6_P63D <= 9999)) AND NOT MISSING(LLAMA.S6_P63D) AND NOT NOTAPPLICABLE(LLAMA.S6_P63D) AND LLAMA.S6_P63D = 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V157
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_llama_s6_p63d_species_total_zero.csv" UTF8
