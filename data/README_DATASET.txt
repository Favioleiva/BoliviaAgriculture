Bolivia Agricultural Census 2013 — dataset / datos

339 municipalities / municipios. 22,864 statistical variables / variables estadísticas.
municipal_data.parquet: values / valores; mun_code is a six-character string / texto de seis caracteres.
dictionary_bilingual.parquet or .csv: code, definition_es, definition_en and provenance / trazabilidad.
cell_status.parquet and status_dictionary.csv: quality and missingness / calidad y datos faltantes.
variable_aliases.parquet: original = canonical * numerator / denominator.
source_definitions.parquet: original definitions / definiciones originales.
alias_status_overrides.parquet: original status when different / estados originales diferentes.
municipal_context.parquet and context_dictionary.csv: estimated population denominators,
separate from observed census values / denominadores poblacionales estimados, separados
de los valores censales observados. Population 2013 is interpolated / Población 2013 interpolada.

This archive contains the dataset and dictionaries only. The full BoliviaAgriculturalCensus2013
folder additionally contains the offline viewer, original aggregate sources, maps and programs.
Este ZIP contiene los datos y diccionarios. La carpeta completa incluye además el visor sin
conexión, agregados originales, mapas y programas de reproducción.

Do not sum all columns: totals, components and seasons overlap. No sumar todas las columnas:
los totales, componentes y campañas se superponen. Honey quantities are withheld as null,
not zero / Las cantidades de miel se retienen como nulas, no cero.
Mass conversion / conversión: kg = qq * 46, documented release convention.
Annual production / producción anual: July 2012–June 2013 / julio 2012–junio 2013.
Remaining source discrepancies are recorded in the dictionary / Las discrepancias de origen
se conservan y documentan. Technical validation is not scientific certification of each variable.
La validación técnica no certifica científicamente cada variable.

Read / lectura: import pyarrow.parquet as pq; table = pq.read_table('data/municipal_data.parquet')
