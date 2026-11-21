RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V97 AS COUNT MAQAGRI FILTER MAQAGRI.S5_P39C = 1982 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V97
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maqagri_s5_p39c_c0030_records.csv" UTF8
