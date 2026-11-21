RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V143 AS COUNT PERSONAL FILTER PERSONAL.S14_P124 = 2 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V143
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_personal_s14_p124_c0001_records.csv" UTF8
