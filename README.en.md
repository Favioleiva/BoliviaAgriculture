# Bolivia Agriculture

### Bolivia Agricultural Census 2013 · Municipal data

[Español](README.md) · [Download dataset](https://github.com/Favioleiva/BoliviaAgriculture/raw/refs/heads/main/data/dataset_bundle.zip) · [Parquet](https://github.com/Favioleiva/BoliviaAgriculture/raw/refs/heads/main/data/municipal_data.parquet) · [ES / EN dictionary](https://github.com/Favioleiva/BoliviaAgriculture/raw/refs/heads/main/data/dictionary_bilingual.csv)

A dataset for studying **what Bolivia produces, where production takes place, and how agricultural activity is organized**. It brings together information from the 2013 Agricultural Census for **339 municipalities**, with interactive maps, downloadable data and Spanish–English definitions.

Coverage includes crops and cultivated areas, agricultural production, livestock, agricultural work, water, machinery, infrastructure, forests and production services.

<img src="Agro2013/assets/hero-agriculture-v3.png" alt="Illustration of representative Bolivian agricultural animals and crops" width="680">

*AI-generated illustration for the viewer; not a statistical measurement.*

## Get started

| Task | Download or open |
|---|---|
| Analyze the data | [Dataset and dictionaries ZIP — 8.5 MB](https://github.com/Favioleiva/BoliviaAgriculture/raw/refs/heads/main/data/dataset_bundle.zip) |
| Read the municipal matrix | [Parquet — 13.8 MB](https://github.com/Favioleiva/BoliviaAgriculture/raw/refs/heads/main/data/municipal_data.parquet) |
| Understand the variables | [Bilingual dictionary CSV](https://github.com/Favioleiva/BoliviaAgriculture/raw/refs/heads/main/data/dictionary_bilingual.csv) · [Parquet](https://github.com/Favioleiva/BoliviaAgriculture/raw/refs/heads/main/data/dictionary_bilingual.parquet) |
| Explore maps offline | [Download the full repository](https://github.com/Favioleiva/BoliviaAgriculture/archive/refs/heads/main.zip), extract it and open `index.html` |
| Use municipal boundaries | [339-municipality Shapefile, 2015 reference](https://github.com/Favioleiva/BoliviaAgriculture/raw/refs/heads/main/EarthEngine/bolivia339_2015.zip) |

The dataset ZIP contains tables and dictionaries. The full repository also includes the viewer, images, maps, source aggregates and programs. **The viewer runs locally without an internet connection.** Opening an HTML file in GitHub's Code tab displays its source; open the downloaded copy in your browser to use the viewer.

## Dataset contents

Each row of `municipal_data.parquet` represents one municipality. `mun_code` and `cna_code` are six-character text identifiers with leading zeros.

| Content | Count |
|---|---:|
| Municipalities | 339 |
| Analytical columns | 11,897 |
| Diagnostic columns | 10,967 |
| Identification columns | 8 |

Analytical columns include counts and physical sums. Diagnostic columns describe special responses, missingness and coverage. **The columns are not all independent indicators:** totals, components, seasons and different observation units coexist.

The dictionary identifies each variable through `code`, with `definition_es`, `definition_en`, units, period, source, filter, formula and reproduction program. Municipality-specific flags are preserved in [cell_status.parquet](data/cell_status.parquet), with a [status dictionary](data/status_dictionary.csv).

## Read the data in Python

Install `pyarrow` if needed. From the extracted dataset folder:

```python
import pyarrow.parquet as pq

data = pq.read_table("data/municipal_data.parquet")
dictionary = pq.read_table("data/dictionary_bilingual.parquet")

# Recorded annual potato production, in kilograms
potato = data.select([
    "mun_code", "municipality", "department",
    "cna13_annual_01510000_kg",
])
print(potato.to_pylist()[:5])
```

## Analytical considerations

- **Redundancy:** 5,670 verified duplicate columns were consolidated from 28,534 source definitions. The [alias table](data/variable_aliases.csv) retains their original codes and definitions. Matching values alone were not sufficient grounds for removing a variable.
- **Quantities and units:** mass series originally recorded in quintals are provided in kilograms using `kg = qq × 46`, the documented convention for this release. Original sources are retained.
- **Annual production:** combines winter 2012 and summer 2012–2013, corresponding to the agricultural year July 2012–June 2013. Do not add it to its constituent seasons.
- **Holdings and records:** an agricultural production unit (UPA) may contain multiple records. Counts of records, holdings, workers, animals and hectares have different meanings.
- **Missingness and quality:** null does not mean zero. Honey quantities remain null because of an unresolved source-scale discrepancy. Other differences against source controls are documented without adjusting the values.
- **Geography:** 2013 census data are operationally linked to a 2015 reference map; identical historical boundaries are not certified.
- **Estimated population:** viewer population denominators are separate in [municipal_context.parquet](data/municipal_context.parquet). The 2013 estimate is neither an agricultural census population count nor an official projection.

## Sources and reproduction

Statistical source: **Bolivia's National Institute of Statistics (INE), Agricultural Census 2013**. See the [INE catalogue](https://anda.ine.gob.bo/index.php/catalog/229). The dataset combines published municipal aggregates and calculations from the REDATAM database available to the project. REDATAM microdata are not distributed here.

The geographic reference comes from [Geo4Bolivia](https://github.com/quarcs-lab/geo4bolivia/tree/5fd1dbe9b508cc6996daa62ae15b9d224094f1c4). Dataset and viewer prepared by **Favio Leiva**, with assistance from Codex.

Individual programs are linked in the dictionary's `recipe` column. To rebuild the Parquet files from the included aggregates, run from the repository root:

```shell
python -B Code/build_portable_dataset.py --sources . --output ../BoliviaAgriculturalCensus2013_rebuilt --policy Code/choice_policy.json
```

Environment used: Python 3.12 and PyArrow 24.0.0. Rerunning REDATAM programs requires the original database and path configuration.

<details>
<summary>File organization and technical evidence</summary>

| Directory | Contents |
|---|---|
| `data/` | Consolidated dataset, dictionaries, status flags and aliases |
| `Agro2013/` | Interactive viewer and visual assets |
| `EarthEngine/` | Municipal boundaries |
| `Code/` | Package construction and checks |
| `FullExpansion/`, `CategoryExpansion/`, `RedatamExploration/` | Source aggregates, catalogues and individual programs |
| `Validation/`, `Provenance/` | Checks and provenance |

The release passed 9,672,687 value comparisons against its sources, together with checks of keys, nulls, reconstruction and downloads. These technical checks do not automatically resolve the scientific limitations described above. See the [validation results](Validation/portable_validation.json) and [redundancy audit](data/redundancy_audit.json).

</details>

Report a problem or suggest an improvement through [issues](https://github.com/Favioleiva/BoliviaAgriculture/issues).

## License and citation

Newly authored code, interactive viewer, reproduction scripts, and documentation in this repository are released under the **MIT License** ([LICENSE](LICENSE), Copyright (c) 2026 Favio Leiva). Underlying 2013 Agricultural Census data from INE Bolivia and Geo4Bolivia reference boundaries retain their respective original licenses and terms.

### How to cite

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

Structured citation metadata are available in [CITATION.cff](CITATION.cff).
