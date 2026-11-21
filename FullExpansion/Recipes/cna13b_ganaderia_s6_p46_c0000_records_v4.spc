RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V31 AS COUNT GANADERIA FILTER GANADERIA.S6_P46 = 1 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V31
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ganaderia_s6_p46_c0000_records.csv" UTF8
