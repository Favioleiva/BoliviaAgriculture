RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V43 AS COUNT INFRAGRI FILTER INFRAGRI.S5_38 = 4 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V43
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_infragri_s5_38_1a_c0003_records.csv" UTF8
