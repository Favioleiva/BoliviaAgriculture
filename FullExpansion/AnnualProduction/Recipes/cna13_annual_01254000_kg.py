from pathlib import Path
import sys
root=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(root))
from aggregate import execute
execute(root, 'cna13_annual_01254000_kg', ['cna13b_cultinv_s4_p23_6_c0040_sum', 'cna13b_cultver_s4_p24_8_c0053_sum'])
