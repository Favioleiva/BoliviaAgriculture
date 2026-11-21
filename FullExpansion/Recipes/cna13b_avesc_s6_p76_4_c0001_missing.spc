RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V3 AS COUNT AVESC FILTER (AVESC.S6_P76_2 = 2) AND MISSING(AVESC.S6_P76_4) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V3
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_avesc_s6_p76_4_c0001_missing.csv" UTF8
