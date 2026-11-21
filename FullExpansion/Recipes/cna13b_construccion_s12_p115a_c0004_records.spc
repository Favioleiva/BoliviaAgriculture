RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V83 AS COUNT CONSTRUCCION FILTER CONSTRUCCION.S12_P115 = 5 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V83
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_construccion_s12_p115a_c0004_records.csv" UTF8
