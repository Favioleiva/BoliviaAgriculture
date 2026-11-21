RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V123 AS COUNT CAPRINO FILTER (CAPRINO.S6_P60A = 4) AND MISSING(CAPRINO.S6_P60D) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V123
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_caprino_s6_p60d_c0002_missing.csv" UTF8
