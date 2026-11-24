# Bolivia Agriculture

### Censo Agropecuario 2013 · Datos municipales de Bolivia

[English](README.en.md) · [Descargar dataset](https://github.com/Favioleiva/BoliviaAgriculture/raw/refs/heads/main/data/dataset_bundle.zip) · [Parquet](https://github.com/Favioleiva/BoliviaAgriculture/raw/refs/heads/main/data/municipal_data.parquet) · [Diccionario ES / EN](https://github.com/Favioleiva/BoliviaAgriculture/raw/refs/heads/main/data/dictionary_bilingual.csv)

Una base para estudiar **qué produce Bolivia, dónde se produce y cómo se organiza la actividad agropecuaria**. Reúne información del Censo Agropecuario 2013 en **339 municipios**, con mapas interactivos, descargas y definiciones en español e inglés.

Incluye cultivos y superficies, producción agrícola, ganado, trabajo agropecuario, agua, maquinaria, infraestructura, bosques y servicios a la producción.

<img src="Agro2013/assets/hero-agriculture-v3.png" alt="Ilustración de animales y cultivos representativos de la agricultura boliviana" width="680">

*Ilustración generada con IA para el visor; no representa una medición estadística.*

## Empezar

| Quiero… | Qué descargar o abrir |
|---|---|
| Analizar los datos | [Dataset y diccionarios en ZIP — 8.5 MB](https://github.com/Favioleiva/BoliviaAgriculture/raw/refs/heads/main/data/dataset_bundle.zip) |
| Leer la matriz municipal | [Parquet — 13.8 MB](https://github.com/Favioleiva/BoliviaAgriculture/raw/refs/heads/main/data/municipal_data.parquet) |
| Entender las variables | [Diccionario bilingüe CSV](https://github.com/Favioleiva/BoliviaAgriculture/raw/refs/heads/main/data/dictionary_bilingual.csv) · [Parquet](https://github.com/Favioleiva/BoliviaAgriculture/raw/refs/heads/main/data/dictionary_bilingual.parquet) |
| Explorar los mapas sin conexión | [Descargar el repositorio completo](https://github.com/Favioleiva/BoliviaAgriculture/archive/refs/heads/main.zip), descomprimir y abrir `index.html` |
| Usar los límites municipales | [Shapefile de 339 municipios, referencia 2015](https://github.com/Favioleiva/BoliviaAgriculture/raw/refs/heads/main/EarthEngine/bolivia339_2015.zip) |

El ZIP del dataset contiene las tablas y sus diccionarios. El repositorio completo incorpora además el visor, sus imágenes, mapas, fuentes agregadas y programas. **El visor funciona localmente sin internet.** Abrir un archivo HTML en la pestaña Code de GitHub muestra su código; para verlo, abre la copia descargada en tu navegador.

## Qué contiene la base

Cada fila de `municipal_data.parquet` representa un municipio. `mun_code` y `cna_code` son identificadores de texto de seis caracteres, con ceros iniciales.

| Contenido | Cantidad |
|---|---:|
| Municipios | 339 |
| Columnas analíticas | 11,897 |
| Columnas de diagnóstico | 10,967 |
| Columnas de identificación | 8 |

Las columnas analíticas incluyen conteos y sumas físicas. Las diagnósticas permiten examinar respuestas especiales, faltantes y cobertura. **No todas las columnas son indicadores independientes:** hay totales, componentes, campañas y distintas unidades de análisis.

El diccionario identifica cada variable mediante `code`, con `definition_es` y `definition_en`, unidad, periodo, fuente, filtro, fórmula y programa de reproducción. Los estados de cada municipio se conservan en [cell_status.parquet](data/cell_status.parquet), con su [diccionario de estados](data/status_dictionary.csv).

## Leer los datos en Python

Instala `pyarrow` si todavía no lo tienes. Desde la carpeta del dataset descomprimido:

```python
import pyarrow.parquet as pq

data = pq.read_table("data/municipal_data.parquet")
dictionary = pq.read_table("data/dictionary_bilingual.parquet")

# Producción anual registrada de papa, en kilogramos
potato = data.select([
    "mun_code", "municipality", "department",
    "cna13_annual_01510000_kg",
])
print(potato.to_pylist()[:5])
```

## Decisiones que importan para el análisis

- **Redundancias:** se consolidaron 5,670 columnas verificadas entre 28,534 definiciones de origen. Las [equivalencias](data/variable_aliases.csv) conservan los códigos y definiciones originales. Una coincidencia de valores por sí sola no justificó eliminar una variable.
- **Cantidades y unidades:** las series de masa originalmente en quintales se ofrecen en kilogramos mediante `kg = qq × 46`, la convención documentada de esta entrega. Las fuentes originales se conservan.
- **Producción anual:** combina invierno 2012 y verano 2012–2013; corresponde al año agrícola julio 2012–junio 2013. No debe sumarse nuevamente con sus campañas.
- **UPA y registros:** una unidad de producción agropecuaria puede tener varios registros. Los conteos de registros, UPA, trabajadores, animales y hectáreas tienen interpretaciones diferentes.
- **Faltantes y calidad:** un nulo no equivale a cero. Las cantidades de miel permanecen nulas por una discrepancia de escala no resuelta. Otras diferencias con controles originales se documentan sin ajustar las cifras.
- **Geografía:** los datos censales de 2013 se enlazan operativamente con un mapa de referencia 2015; no se certifica que ambos límites sean idénticos.
- **Población estimada:** los denominadores poblacionales del visor están separados en [municipal_context.parquet](data/municipal_context.parquet). La estimación para 2013 no es un conteo censal agropecuario ni una proyección oficial.

## Fuentes y reproducción

Fuente estadística: **Instituto Nacional de Estadística de Bolivia, Censo Agropecuario 2013**. Consulta el [catálogo del INE](https://anda.ine.gob.bo/index.php/catalog/229). La base reúne agregados municipales publicados y cálculos sobre la base REDATAM disponible en el proyecto. Los microdatos REDATAM no se distribuyen aquí.

La referencia cartográfica procede de [Geo4Bolivia](https://github.com/quarcs-lab/geo4bolivia/tree/5fd1dbe9b508cc6996daa62ae15b9d224094f1c4). Preparación del dataset y visor: **Favio Leiva**, con asistencia de Codex.

Los programas individuales se enlazan desde la columna `recipe` del diccionario. Para reconstruir los Parquet desde los agregados incluidos, ejecuta desde la raíz del repositorio:

```shell
python -B Code/build_portable_dataset.py --sources . --output ../BoliviaAgriculturalCensus2013_rebuilt --policy Code/choice_policy.json
```

Entorno utilizado: Python 3.12 y PyArrow 24.0.0. Reejecutar los programas REDATAM requiere la base original y configurar sus rutas.

<details>
<summary>Organización de los archivos y evidencia técnica</summary>

| Carpeta | Contenido |
|---|---|
| `data/` | Dataset consolidado, diccionarios, estados y equivalencias |
| `Agro2013/` | Visor interactivo y recursos visuales |
| `EarthEngine/` | Cartografía municipal |
| `Code/` | Construcción del paquete y verificaciones |
| `FullExpansion/`, `CategoryExpansion/`, `RedatamExploration/` | Agregados de origen, catálogos y programas individuales |
| `Validation/`, `Provenance/` | Comprobaciones y trazabilidad |

La entrega pasó 9,672,687 comparaciones de valores contra sus fuentes, además de comprobaciones de claves, nulos, reconstrucción y descargas. Estas verificaciones técnicas no resuelven automáticamente las limitaciones científicas descritas arriba. Véase [la validación](Validation/portable_validation.json) y [la auditoría de redundancias](data/redundancy_audit.json).

</details>

Para señalar un problema o proponer una mejora, abre un [issue](https://github.com/Favioleiva/BoliviaAgriculture/issues).

## Licencia y cita

El código fuente, el visor interactivo, los scripts de reproducción y la documentación original de este repositorio se distribuyen bajo la **Licencia MIT** ([LICENSE](LICENSE), Copyright (c) 2026 Favio Leiva). Los datos del Censo Agropecuario 2013 del INE y la cartografía de referencia de Geo4Bolivia conservan sus licencias y términos originales.

### Cómo citar

> Leiva, F. (2026). *BoliviaAgriculture: Municipal Dataset, Bilingual Dictionary, and Interactive Viewer of the 2013 Bolivia Agricultural Census (339 Municipalities)* [Software and dataset]. GitHub. https://github.com/Favioleiva/BoliviaAgriculture

```bibtex
@misc{leiva2026boliviaagriculture,
  author       = {Leiva, Favio},
  title        = {{BoliviaAgriculture: Municipal Dataset, Bilingual Dictionary, and Interactive Viewer of the 2013 Bolivia Agricultural Census (339 Municipalities)}},
  year         = {2026},
  publisher    = {GitHub},
  howpublished = {\url{https://github.com/Favioleiva/BoliviaAgriculture}},
  note         = {MIT License (code, viewer, and original documentation); underlying INE 2013 Agricultural Census data and Geo4Bolivia reference boundaries retain their original terms}
}
```

Metadatos de cita estructurados disponibles en [CITATION.cff](CITATION.cff).
