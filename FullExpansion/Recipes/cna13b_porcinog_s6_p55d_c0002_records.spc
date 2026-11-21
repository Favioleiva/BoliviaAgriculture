RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V41 AS COUNT PORCINOG FILTER PORCINOG.S6_P55A = "03" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V41
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_porcinog_s6_p55d_c0002_records.csv" UTF8
