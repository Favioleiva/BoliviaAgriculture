RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V27 AS COUNT EQUIGAN FILTER EQUIGAN.PRIMER_ANO = 1975 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V27
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_equigan_primer_ano_c0003_records.csv" UTF8
