RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V60 AS COUNT OTRESP FILTER (OTRESP.S6_P70_1 = 4) AND NOTAPPLICABLE(OTRESP.S6_P70_5) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V60
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_otresp_s6_p70_5_c0003_not_applicable.csv" UTF8
