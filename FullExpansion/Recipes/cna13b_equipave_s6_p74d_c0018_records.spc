RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V21 AS COUNT EQUIPAVE FILTER EQUIPAVE.S6_P74D = 2004 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V21
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_equipave_s6_p74d_c0018_records.csv" UTF8
