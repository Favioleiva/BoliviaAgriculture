RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V3 AS COUNT ESPPESCA FILTER ESPPESCA.S10_P101C = "Oct" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V3
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_esppesca_s10_p101c_c0011_records.csv" UTF8
