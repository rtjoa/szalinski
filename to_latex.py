import pandas as pd
df = pd.read_csv("out/aec-table2/table2.csv", index_col=False)

df = df.rename(columns={col: col.strip() for col in df.columns})
df = df[['Id', 'c_in', 'No CAD', 'c_out', 'Ruler']]
df = df.rename(columns={
    'c_in': 'Init',
    'No CAD': 'Baseline',
    'c_out': 'Szalinski',
    'Ruler': "Szalinski w/ \\tool's CAD",
})

m = df.drop('Id', axis=1).mean()
m['Id'] = 'Average'

df = df.round(0)
df = df.convert_dtypes()

df = pd.concat([df, pd.DataFrame([m])])

s = df.to_latex(index=False, float_format="%.1f")

final = []
for line in s.split('\n'):
    if 'Average' in line:
        final.append('\\midrule')
        final.append(line)
    else:
        final.append(line.replace(".0", ""))

print('\n'.join(final))
   