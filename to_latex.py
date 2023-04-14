#!python3
import pandas as pd
import sys
s = sys.argv[1] if len(sys.argv) > 1 else "out/aec-table2/table2.csv"
print(s)
print()
df = pd.read_csv(s, index_col=False)

df = df.rename(columns={col: col.strip() for col in df.columns})

INIT = 'Init'
BASELINE = 'Baseline'
SZ = 'Szalinski'
RULER = "Szalinski w/ \\tool's CAD"

df = df.rename(columns={
    'c_in': INIT,
    'No CAD': BASELINE,
    'c_out': SZ,
    'Ruler': RULER,
})

m = df.drop('Id', axis=1).mean()
m['Id'] = 'Average'

df = df._append(m, ignore_index=True)

d = df.to_dict()

from copy import deepcopy
d2 = deepcopy(d)

for idx, test in d['Id'].items():
    for col in reversed([INIT, BASELINE, SZ, RULER]):
        f = (lambda x: round(x, 1)) if test == 'Average' else (lambda x: round(x))
        absolute = f(d[col][idx])
        d[col][idx] = f"{round(100 * (1 - (d[col][idx] / d[INIT][idx])))}\\% ({absolute})"

        if col in (RULER,) and d2[col][idx] == min(d2[SZ][idx], d2[RULER][idx]):
            d[col][idx] = f"\\textbf{{{d[col][idx]}}}"

df = df.astype(str)



for col, d_ in d.items():
    for idx, v in d_.items():
        df.loc[idx, col] = v

df = df[['Id', BASELINE, SZ, RULER]]


s = df.to_latex(index=False)

final = []
for line in s.split('\n'):
    if 'Average' in line:
        final.append('\\midrule')
    final.append(line)

final = final[2:-3]
print('\n'.join(final))
   