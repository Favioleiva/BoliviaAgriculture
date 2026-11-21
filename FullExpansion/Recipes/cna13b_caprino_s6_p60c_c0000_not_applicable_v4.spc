RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V84 AS COUNT CAPRINO FILTER (CAPRINO.S6_P60A = 2) AND NOTAPPLICABLE(CAPRINO.S6_P60C) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V84
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_caprino_s6_p60c_c0000_not_applicable.csv" UTF8
