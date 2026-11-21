RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V153 AS COUNT INFRGAN FILTER INFRGAN.S7_P86C = 2003 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V153
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_infrgan_s7_p86c_c0018_records.csv" UTF8
