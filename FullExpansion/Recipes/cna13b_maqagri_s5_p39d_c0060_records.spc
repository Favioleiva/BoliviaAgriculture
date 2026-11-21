RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V123 AS COUNT MAQAGRI FILTER MAQAGRI.S5_P39D = 2012 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V123
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maqagri_s5_p39d_c0060_records.csv" UTF8
