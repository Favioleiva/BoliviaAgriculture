RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V153 AS COUNT CULTPAS FILTER CULTPAS.S4_P26_A = "01919033" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V153
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_cultpas_s4_p26_a_c0030_records.csv" UTF8
