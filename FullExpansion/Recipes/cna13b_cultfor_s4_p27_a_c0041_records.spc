RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V35 AS COUNT CULTFOR FILTER CULTFOR.S4_P27_A = "03120039" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V35
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultfor_s4_p27_a_c0041_records.csv" UTF8
