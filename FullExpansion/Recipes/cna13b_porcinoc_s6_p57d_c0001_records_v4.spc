RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V33 AS COUNT PORCINOC FILTER PORCINOC.S6_P57A = "02" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V33
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_porcinoc_s6_p57d_c0001_records.csv" UTF8
