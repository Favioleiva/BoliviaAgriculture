RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V47 AS COUNT MAQUINARIA FILTER MAQUINARIA.S12_P116B = 2001 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V47
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maquinaria_s12_p116b_c0048_records.csv" UTF8
