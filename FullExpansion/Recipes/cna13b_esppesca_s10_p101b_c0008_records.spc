RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V131 AS COUNT ESPPESCA FILTER ESPPESCA.S10_P101B = "Mar" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V131
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_esppesca_s10_p101b_c0008_records.csv" UTF8
