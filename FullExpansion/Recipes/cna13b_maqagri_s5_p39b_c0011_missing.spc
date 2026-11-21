RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V125 AS COUNT MAQAGRI FILTER (MAQAGRI.S5_P39A = 12) AND MISSING(MAQAGRI.S5_P39B) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V125
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maqagri_s5_p39b_c0011_missing.csv" UTF8
