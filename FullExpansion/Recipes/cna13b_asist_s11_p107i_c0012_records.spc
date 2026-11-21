RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V111 AS COUNT ASIST FILTER ASIST.S11_P107I = 12 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V111
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_asist_s11_p107i_c0012_records.csv" UTF8
