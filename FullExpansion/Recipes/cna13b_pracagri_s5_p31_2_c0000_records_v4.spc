RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V7 AS COUNT PRACAGRI FILTER PRACAGRI.S5_P31_2 = 1 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V7
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_pracagri_s5_p31_2_c0000_records.csv" UTF8
