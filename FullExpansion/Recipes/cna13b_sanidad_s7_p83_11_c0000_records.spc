RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V1 AS COUNT SANIDAD FILTER SANIDAD.S7_P83_11 = 1 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V1
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_sanidad_s7_p83_11_c0000_records.csv" UTF8
