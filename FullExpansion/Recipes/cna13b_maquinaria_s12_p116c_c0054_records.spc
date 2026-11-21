RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V21 AS COUNT MAQUINARIA FILTER MAQUINARIA.S12_P116C = 2007 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V21
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maquinaria_s12_p116c_c0054_records.csv" UTF8
