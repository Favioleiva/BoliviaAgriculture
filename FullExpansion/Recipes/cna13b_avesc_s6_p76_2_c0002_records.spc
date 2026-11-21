RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V93 AS COUNT AVESC FILTER AVESC.S6_P76_2 = 3 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V93
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_avesc_s6_p76_2_c0002_records.csv" UTF8
