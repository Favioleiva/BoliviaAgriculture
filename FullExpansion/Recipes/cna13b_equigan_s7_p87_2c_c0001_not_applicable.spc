RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V150 AS COUNT EQUIGAN FILTER (EQUIGAN.S7_P87_1A = 2) AND NOTAPPLICABLE(EQUIGAN.S7_P87_2C) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V150
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_equigan_s7_p87_2c_c0001_not_applicable.csv" UTF8
