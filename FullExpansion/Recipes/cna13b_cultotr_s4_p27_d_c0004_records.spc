RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V1 AS COUNT CULTOTR FILTER CULTOTR.S4_P27_D = "07000050" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V1
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultotr_s4_p27_d_c0004_records.csv" UTF8
