RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V67 AS COUNT ESPPESCA FILTER ESPPESCA.S10_P101A = "041215300" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V67
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_esppesca_s10_p101a_c0153_records.csv" UTF8
