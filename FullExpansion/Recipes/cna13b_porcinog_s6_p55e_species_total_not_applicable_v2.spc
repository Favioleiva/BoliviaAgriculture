RUNDEF individual
 DICTIONARY "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\RedatamExploration\WorkBase\CNA2013.dicx"
 SELECTION ALL
 NOWEIGHT


DEFINE MUNIC.V76 AS COUNT PORCINOG FILTER (PORCINOG.S6_P55A = "02" OR PORCINOG.S6_P55A = "03" OR PORCINOG.S6_P55A = "04") AND (NOTAPPLICABLE(PORCINOG.S6_P55E)) TYPE INTEGER
TABLE RESULTA AS AREALIST OF MUNIC, MUNIC.V76
 OUTPUTFILE CSV "X:\Agentic Tasks\Bolivia\Outputs\Contract_04\Evidence\FullExpansion\RecipeRuns\cna13b_porcinog_s6_p55e_species_total_not_applicable_v2.csv" UTF8
