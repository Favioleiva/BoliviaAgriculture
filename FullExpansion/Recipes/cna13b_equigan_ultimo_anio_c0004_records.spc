RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V101 AS COUNT EQUIGAN FILTER EQUIGAN.ULTIMO_ANIO = 1990 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V101
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_equigan_ultimo_anio_c0004_records.csv" UTF8
