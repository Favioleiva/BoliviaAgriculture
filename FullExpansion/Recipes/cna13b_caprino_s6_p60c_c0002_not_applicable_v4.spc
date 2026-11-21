RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V100 AS COUNT CAPRINO FILTER (CAPRINO.S6_P60A = 4) AND NOTAPPLICABLE(CAPRINO.S6_P60C) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V100
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_caprino_s6_p60c_c0002_not_applicable.csv" UTF8
