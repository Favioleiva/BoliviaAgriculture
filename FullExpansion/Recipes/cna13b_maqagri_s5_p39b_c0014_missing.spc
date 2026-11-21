RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V149 AS COUNT MAQAGRI FILTER (MAQAGRI.S5_P39A = 15) AND MISSING(MAQAGRI.S5_P39B) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V149
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maqagri_s5_p39b_c0014_missing.csv" UTF8
