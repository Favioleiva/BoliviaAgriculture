from pathlib import Path
from decimal import Decimal
import csv
root = Path(__file__).resolve().parents[2]
source = root / 'Modules' / 'forest.csv'
target = root / 'Kilograms' / 'RecipeRuns' / 'cna13b_espnomader_sf_96a_c0105_sum_kg.csv'
target.parent.mkdir(parents=True, exist_ok=True)
with source.open(encoding='utf-8-sig', newline='') as src, target.open('w', encoding='utf-8', newline='') as dst:
    writer = csv.writer(dst)
    writer.writerow(['municipio_id', 'year', 'source_indicator', 'original_qq', 'kilogramos'])
    for row in csv.DictReader(src):
        raw = row['cna13b_espnomader_sf_96a_c0105_sum']
        kg = '' if raw == '' else format(Decimal(raw) * Decimal('46'), 'f')
        writer.writerow([row['municipio_id'], row['year'], 'cna13b_espnomader_sf_96a_c0105_sum', raw, kg])
