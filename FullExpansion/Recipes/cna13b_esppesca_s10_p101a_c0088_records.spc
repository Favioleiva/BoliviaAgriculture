RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V97 AS COUNT ESPPESCA FILTER ESPPESCA.S10_P101A = "041208700" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V97
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_esppesca_s10_p101a_c0088_records.csv" UTF8
