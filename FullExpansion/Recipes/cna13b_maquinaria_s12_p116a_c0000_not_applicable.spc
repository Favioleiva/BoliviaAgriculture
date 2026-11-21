RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V158 AS COUNT MAQUINARIA FILTER (MAQUINARIA.CATEGORIA = 1) AND NOTAPPLICABLE(MAQUINARIA.S12_P116A) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V158
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maquinaria_s12_p116a_c0000_not_applicable.csv" UTF8
