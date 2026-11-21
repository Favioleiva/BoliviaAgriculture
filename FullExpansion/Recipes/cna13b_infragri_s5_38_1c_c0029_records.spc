RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V5 AS COUNT INFRAGRI FILTER INFRAGRI.S5_38_1C = 1979 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V5
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_infragri_s5_38_1c_c0029_records.csv" UTF8
