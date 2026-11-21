RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V109 AS COUNT INFRGAN FILTER (INFRGAN.S7_P86 = 4) AND MISSING(INFRGAN.S7_P86A) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V109
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_infrgan_s7_p86a_c0003_missing.csv" UTF8
