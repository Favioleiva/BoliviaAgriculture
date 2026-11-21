RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V37 AS COUNT LLAMA FILTER LLAMA.S6_P63A = 4 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V37
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_llama_s6_p63a_c0001_records.csv" UTF8
