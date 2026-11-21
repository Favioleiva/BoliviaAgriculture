RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V107 AS COUNT MAQUINARIA FILTER MAQUINARIA.CATEGORIA = 6 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V107
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_maquinaria_categoria_c0005_records.csv" UTF8
