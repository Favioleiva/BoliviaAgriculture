RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V55 AS COUNT EQUIGAN FILTER EQUIGAN.PRIMER_ANO = 1996 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V55
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_equigan_primer_ano_c0017_records.csv" UTF8
