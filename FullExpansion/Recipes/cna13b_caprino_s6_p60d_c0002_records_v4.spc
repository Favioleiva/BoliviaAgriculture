RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V121 AS COUNT CAPRINO FILTER CAPRINO.S6_P60A = 4 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V121
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_caprino_s6_p60d_c0002_records.csv" UTF8
