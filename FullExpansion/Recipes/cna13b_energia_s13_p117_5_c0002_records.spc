RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V29 AS COUNT ENERGIA FILTER ENERGIA.S13_P117_5 = 9 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V29
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_energia_s13_p117_5_c0002_records.csv" UTF8
