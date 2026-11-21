RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V149 AS COUNT MAQUINARIA FILTER MAQUINARIA.S12_P116B = 1972 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V149
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maquinaria_s12_p116b_c0019_records.csv" UTF8
