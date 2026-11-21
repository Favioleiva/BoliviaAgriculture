RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V7 AS COUNT INFRAGRI FILTER INFRAGRI.S5_38_1B = 1965 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V7
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_infragri_s5_38_1b_c0015_records.csv" UTF8
