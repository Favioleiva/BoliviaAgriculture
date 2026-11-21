RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V79 AS COUNT CULTFOR FILTER CULTFOR.S4_P27_A = "03120064" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V79
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultfor_s4_p27_a_c0063_records.csv" UTF8
