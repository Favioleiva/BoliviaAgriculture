RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V155 AS COUNT EQUIPAVE FILTER EQUIPAVE.S6_P74D = 1991 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V155
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_equipave_s6_p74d_c0005_records.csv" UTF8
