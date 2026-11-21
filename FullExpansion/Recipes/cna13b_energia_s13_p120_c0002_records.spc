RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V65 AS COUNT ENERGIA FILTER ENERGIA.S13_P120 = 3 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V65
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_energia_s13_p120_c0002_records.csv" UTF8
