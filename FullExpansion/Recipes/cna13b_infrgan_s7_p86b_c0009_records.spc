RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V75 AS COUNT INFRGAN FILTER INFRGAN.S7_P86B = 1994 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V75
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_infrgan_s7_p86b_c0009_records.csv" UTF8
