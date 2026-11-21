RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V69 AS COUNT CONSTRUCCION FILTER CONSTRUCCION.S12_P115C = 2001 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V69
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_construccion_s12_p115c_c0049_records.csv" UTF8
