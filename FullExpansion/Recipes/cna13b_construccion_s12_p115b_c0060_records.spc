RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V125 AS COUNT CONSTRUCCION FILTER CONSTRUCCION.S12_P115B = 2012 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V125
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_construccion_s12_p115b_c0060_records.csv" UTF8
