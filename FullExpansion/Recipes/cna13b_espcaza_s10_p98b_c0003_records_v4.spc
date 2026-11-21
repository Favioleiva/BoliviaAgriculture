RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V35 AS COUNT ESPCAZA FILTER ESPCAZA.S10_P98B = "Dic" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V35
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espcaza_s10_p98b_c0003_records.csv" UTF8
