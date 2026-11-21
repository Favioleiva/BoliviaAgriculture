RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V47 AS COUNT ESPMADER FILTER ESPMADER.COD92_1 = "0323143" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V47
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_espmader_cod92_1_c0330_records.csv" UTF8
