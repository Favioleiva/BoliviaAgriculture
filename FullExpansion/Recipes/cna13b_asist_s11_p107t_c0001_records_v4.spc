RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V79 AS COUNT ASIST FILTER ASIST.S11_P107T = 2 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V79
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_asist_s11_p107t_c0001_records.csv" UTF8
