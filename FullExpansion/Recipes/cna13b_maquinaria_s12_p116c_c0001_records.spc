RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V75 AS COUNT MAQUINARIA FILTER MAQUINARIA.S12_P116C = 1953 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V75
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maquinaria_s12_p116c_c0001_records.csv" UTF8
