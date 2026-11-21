RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V45 AS COUNT GANADERIA FILTER GANADERIA.S6_P68_3 = 2 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V45
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ganaderia_s6_p68_3_c0001_records.csv" UTF8
