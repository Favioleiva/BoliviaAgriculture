from pathlib import Path
import sys
root=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(root))
from aggregate import execute
execute(root, 'cna13_annual_01231004_kg', [None, 'cna13b_cultver_s4_p24_8_c0034_sum'])
