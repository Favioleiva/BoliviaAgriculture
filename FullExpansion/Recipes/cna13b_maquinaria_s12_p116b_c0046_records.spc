RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V43 AS COUNT MAQUINARIA FILTER MAQUINARIA.S12_P116B = 1999 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V43
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maquinaria_s12_p116b_c0046_records.csv" UTF8
