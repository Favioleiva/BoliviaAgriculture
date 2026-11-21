RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V21 AS COUNT PRACAGRI FILTER PRACAGRI.S5_P32 = 2 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V21
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_pracagri_s5_p32_c0001_records.csv" UTF8
