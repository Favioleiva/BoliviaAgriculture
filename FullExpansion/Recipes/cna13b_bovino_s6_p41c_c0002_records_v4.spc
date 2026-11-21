RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V81 AS COUNT BOVINO FILTER BOVINO.S6_P41A = 5 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V81
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_bovino_s6_p41c_c0002_records.csv" UTF8
