RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V68 AS COUNT OVINO FILTER (OVINO.S6_P51A = 4) AND NOTAPPLICABLE(OVINO.S6_P51B) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V68
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_ovino_s6_p51b_c0002_not_applicable.csv" UTF8
