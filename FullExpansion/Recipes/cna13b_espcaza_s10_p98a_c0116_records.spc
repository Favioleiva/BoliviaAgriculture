RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V115 AS COUNT ESPCAZA FILTER ESPCAZA.S10_P98A = "050203700" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V115
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espcaza_s10_p98a_c0116_records.csv" UTF8
