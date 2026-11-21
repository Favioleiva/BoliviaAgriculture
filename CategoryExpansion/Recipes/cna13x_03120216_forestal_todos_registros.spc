RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V137 AS COUNT CULTFOR FILTER CULTFOR.S4_P27_A = "03120216" TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V137
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\CategoryExpansion\RecipeRuns\cna13x_03120216_forestal_todos_registros.csv" UTF8
