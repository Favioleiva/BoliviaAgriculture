RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V78 AS COUNT CONSTRUCCION FILTER (CONSTRUCCION.S12_P115 = 4) AND NOTAPPLICABLE(CONSTRUCCION.S12_P115A) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V78
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_construccion_s12_p115a_c0003_not_applicable.csv" UTF8
