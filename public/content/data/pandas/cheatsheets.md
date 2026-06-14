# Pandas — Cheatsheet

```python
import pandas as pd
import numpy as np

# ── CREATE & LOAD ─────────────────────────────────────────
df = pd.read_csv('file.csv', parse_dates=['date'], index_col='id')
df = pd.read_excel('file.xlsx', sheet_name='Sheet1')
df = pd.DataFrame({'A': [1,2,3], 'B': ['x','y','z']})

# ── INSPECT ───────────────────────────────────────────────
df.shape          # (rows, cols)
df.dtypes         # Column types
df.info()         # Summary + memory
df.describe()     # Stats for numeric cols
df.head(10)       # First N rows
df.isnull().sum() # Missing values per column
df.nunique()      # Unique values per column
df.value_counts() # Frequency count (for Series)

# ── SELECT ────────────────────────────────────────────────
df['col']                   # Series
df[['col1','col2']]         # DataFrame
df.loc[0:5, 'col1':'col3']  # Label-based
df.iloc[0:5, 0:3]           # Position-based
df[df['age'] > 25]          # Filter
df[df['city'].isin(['Mumbai','Delhi'])]
df.query('age > 25 and city == "Mumbai"')

# ── CLEAN ─────────────────────────────────────────────────
df.dropna()                               # Drop rows with any NaN
df.dropna(subset=['col1', 'col2'])        # Drop if these cols NaN
df.fillna(0)                              # Fill NaN with 0
df['col'].fillna(df['col'].median())      # Fill with median
df.fillna(df.groupby('category')['val'].transform('mean'))  # Group fill
df.drop_duplicates(subset=['email'])       # Remove duplicate emails
df.drop_duplicates()                       # All columns must match

# ── TRANSFORM ─────────────────────────────────────────────
df['new'] = df['a'] + df['b']             # Arithmetic
df['upper'] = df['name'].str.upper()      # String ops
df['year'] = df['date'].dt.year           # Date extraction
df['log_val'] = np.log(df['value'])       # Math functions
df['category'] = pd.cut(df['age'], bins=[0,18,35,65,100], labels=['child','young','middle','senior'])
df = df.rename(columns={'old': 'new'})
df = df.drop(columns=['unwanted'])

# ── AGGREGATE ─────────────────────────────────────────────
df.groupby('city')['revenue'].sum()
df.groupby('city').agg({'revenue':'sum', 'orders':'count', 'price':'mean'})
df.groupby(['city','month']).agg(
    total_revenue=('revenue','sum'),
    order_count=('id','count'),
    avg_value=('revenue','mean')
).reset_index()

# Pivot table
pd.pivot_table(df, values='revenue', index='region', columns='month', aggfunc='sum', fill_value=0)

# ── MERGE / JOIN ──────────────────────────────────────────
pd.merge(df1, df2, on='user_id', how='left')   # Left join
pd.merge(df1, df2, on='user_id', how='inner')  # Inner join
pd.concat([df1, df2], ignore_index=True)       # Stack rows

# ── TIME SERIES ───────────────────────────────────────────
df['date'] = pd.to_datetime(df['date'])
df.set_index('date', inplace=True)
df.resample('M').sum()                    # Monthly sum
df.resample('W').agg({'sales':'sum', 'visitors':'mean'})
df.rolling(window=7).mean()              # 7-day moving average

# ── EXPORT ────────────────────────────────────────────────
df.to_csv('output.csv', index=False)
df.to_excel('output.xlsx', sheet_name='Results', index=False)
df.to_json('output.json', orient='records')
```
