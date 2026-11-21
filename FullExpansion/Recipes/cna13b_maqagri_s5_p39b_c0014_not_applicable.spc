RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V150 AS COUNT MAQAGRI FILTER (MAQAGRI.S5_P39A = 15) AND NOTAPPLICABLE(MAQAGRI.S5_P39B) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V150
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maqagri_s5_p39b_c0014_not_applicable.csv" UTF8
