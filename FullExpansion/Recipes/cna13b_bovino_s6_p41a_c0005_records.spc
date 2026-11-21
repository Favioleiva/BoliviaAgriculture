RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V159 AS COUNT BOVINO FILTER BOVINO.S6_P41A = 9 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V159
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_bovino_s6_p41a_c0005_records.csv" UTF8
