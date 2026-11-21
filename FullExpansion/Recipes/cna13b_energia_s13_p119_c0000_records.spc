RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V55 AS COUNT ENERGIA FILTER ENERGIA.S13_P119 = 1 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V55
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_energia_s13_p119_c0000_records.csv" UTF8
