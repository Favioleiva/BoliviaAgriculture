RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V143 AS COUNT CONSTRUCCION FILTER CONSTRUCCION.S12_P115C = 1958 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V143
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_construccion_s12_p115c_c0006_records.csv" UTF8
