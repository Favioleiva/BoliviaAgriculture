RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V123 AS COUNT CULTSEM FILTER CULTSEM.S4_P25_A = "01703000" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V123
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultsem_s4_p25_a_c0135_records.csv" UTF8
