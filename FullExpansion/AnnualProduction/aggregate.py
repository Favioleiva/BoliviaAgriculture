from decimal import Decimal
from pathlib import Path
import csv, json

def combine(values, states):
    valid = [Decimal(v) for v in values if v not in (None, '')]
    bad = any(s in ('SUMA_PARCIAL', 'SIN_VALORES_VALIDOS') for s in states)
    if not valid:
        return None, 'SIN_VALORES_VALIDOS' if bad else 'SIN_REGISTROS'
    total = sum(valid, Decimal(0)) * 46
    if bad:
        return total, 'SUMA_PARCIAL'
    present = [v not in (None, '') for v in values]
    return total, 'AMBAS_CAMPANAS' if all(present) else ('SOLO_INVIERNO' if present[0] else 'SOLO_VERANO')

def execute(root, indicator, sources):
    blob = json.loads((root.parent / 'Modules/agriculture.json').read_text(encoding='utf-8'))
    indices = {key:i for i,key in enumerate(blob['keys'])}
    target = root / 'RecipeRuns' / (indicator + '.csv')
    target.parent.mkdir(parents=True, exist_ok=True)
    with (root.parent / 'Modules/agriculture.csv').open(encoding='utf-8-sig', newline='') as src, target.open('w',encoding='utf-8',newline='') as dst:
        writer=csv.writer(dst);writer.writerow(['municipio_id','year','produccion_anual_kg','estado'])
        for row in csv.DictReader(src):
            pos=indices[row['municipio_id']]
            values=[row[s] if s else None for s in sources]
            states=[blob['status'][s][pos] if s else 'SIN_CATEGORIA' for s in sources]
            value,status=combine(values,states)
            writer.writerow([row['municipio_id'],row['year'],'' if value is None else format(value,'f'),status])
    return target
