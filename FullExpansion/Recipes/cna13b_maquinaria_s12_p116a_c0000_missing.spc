RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V157 AS COUNT MAQUINARIA FILTER (MAQUINARIA.CATEGORIA = 1) AND MISSING(MAQUINARIA.S12_P116A) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V157
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maquinaria_s12_p116a_c0000_missing.csv" UTF8
