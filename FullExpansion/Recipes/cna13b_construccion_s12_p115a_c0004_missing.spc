RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V85 AS COUNT CONSTRUCCION FILTER (CONSTRUCCION.S12_P115 = 5) AND MISSING(CONSTRUCCION.S12_P115A) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V85
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_construccion_s12_p115a_c0004_missing.csv" UTF8
