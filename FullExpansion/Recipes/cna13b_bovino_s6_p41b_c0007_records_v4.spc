RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V49 AS COUNT BOVINO FILTER BOVINO.S6_P41A = 11 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V49
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_bovino_s6_p41b_c0007_records.csv" UTF8
