RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V151 AS COUNT INFRAGRI FILTER INFRAGRI.S5_38_1C = 1972 TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V151
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_infragri_s5_38_1c_c0022_records.csv" UTF8
