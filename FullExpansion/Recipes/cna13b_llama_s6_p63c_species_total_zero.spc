RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V149 AS COUNT LLAMA FILTER ((LLAMA.S6_P63C >= 0 AND LLAMA.S6_P63C <= 9999)) AND NOT MISSING(LLAMA.S6_P63C) AND NOT NOTAPPLICABLE(LLAMA.S6_P63C) AND LLAMA.S6_P63C = 0 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V149
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_llama_s6_p63c_species_total_zero.csv" UTF8
