from pathlib import Path
import sys
root=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(root))
from aggregate import execute
execute(root, 'cna13_annual_01961016_kg', ['cna13b_cultinv_s4_p23_6_c0074_sum', 'cna13b_cultver_s4_p24_8_c0243_sum'])
