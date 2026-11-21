RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V71 AS COUNT APOCRED FILTER APOCRED.S11_P113 = 1 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V71
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_apocred_s11_p113_c0000_records.csv" UTF8
