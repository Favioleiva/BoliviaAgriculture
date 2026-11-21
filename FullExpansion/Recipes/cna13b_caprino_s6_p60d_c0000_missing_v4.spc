RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V107 AS COUNT CAPRINO FILTER (CAPRINO.S6_P60A = 2) AND MISSING(CAPRINO.S6_P60D) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V107
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_caprino_s6_p60d_c0000_missing.csv" UTF8
