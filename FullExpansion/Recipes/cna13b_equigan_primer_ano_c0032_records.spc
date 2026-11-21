RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V85 AS COUNT EQUIGAN FILTER EQUIGAN.PRIMER_ANO = 2011 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V85
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_equigan_primer_ano_c0032_records.csv" UTF8
