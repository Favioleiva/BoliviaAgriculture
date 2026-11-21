RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V9 AS COUNT OVINO FILTER OVINO.S6_P51A = 3 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V9
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ovino_s6_p51a_c0001_records.csv" UTF8
