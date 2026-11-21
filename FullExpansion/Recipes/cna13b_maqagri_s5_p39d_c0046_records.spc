RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V95 AS COUNT MAQAGRI FILTER MAQAGRI.S5_P39D = 1998 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V95
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maqagri_s5_p39d_c0046_records.csv" UTF8
