RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V117 AS COUNT CONSTRUCCION FILTER CONSTRUCCION.S12_P115B = 2008 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V117
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_construccion_s12_p115b_c0056_records.csv" UTF8
