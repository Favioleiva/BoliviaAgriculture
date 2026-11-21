RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V53 AS COUNT ESPCAZA FILTER ESPCAZA.S10_P98B = "Sep" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V53
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espcaza_s10_p98b_c0012_records.csv" UTF8
