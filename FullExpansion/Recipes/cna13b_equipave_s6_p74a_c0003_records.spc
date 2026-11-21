RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V83 AS COUNT EQUIPAVE FILTER EQUIPAVE.S6_P74A = 4 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V83
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_equipave_s6_p74a_c0003_records.csv" UTF8
