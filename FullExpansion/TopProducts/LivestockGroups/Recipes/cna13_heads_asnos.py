from pathlib import Path
import csv
from decimal import Decimal
root=Path(__file__).resolve().parents[1]
components=['asnos']
target=root/'RecipeRuns'/'cna13_heads_asnos.csv'
target.parent.mkdir(parents=True,exist_ok=True)
with (root/'source_categories.csv').open(encoding='utf-8-sig',newline='') as src,target.open('w',encoding='utf-8',newline='') as dst:
 writer=csv.writer(dst);writer.writerow(['municipio_id','cabezas','estado'])
 for r in csv.DictReader(src):
  valid=[Decimal(r[f]) for f in components if r[f]!='']
  value=sum(valid) if valid else None
  state='SIN_VALORES_VALIDOS' if value is None else 'SUMA_PARCIAL' if len(valid)!=len(components) else 'PUBLICADO_AGRUPADO'
  writer.writerow([r['municipio_id'],value,state])
