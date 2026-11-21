RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V139 AS COUNT EQUIPAVE FILTER EQUIPAVE.S6_P74C = 2012 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V139
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_equipave_s6_p74c_c0027_records.csv" UTF8
