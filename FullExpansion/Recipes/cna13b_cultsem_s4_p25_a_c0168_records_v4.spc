RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V29 AS COUNT CULTSEM FILTER CULTSEM.S4_P25_A = "01919043" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V29
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultsem_s4_p25_a_c0168_records.csv" UTF8
