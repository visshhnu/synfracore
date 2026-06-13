# Pandas — Intermediate

## Advanced Data Manipulation

```python
import pandas as pd
import numpy as np

# Multi-index DataFrames
df = pd.read_csv('sales.csv', parse_dates=['date'])
df_multi = df.set_index(['region', 'product', 'date'])
df_multi.sort_index(inplace=True)

# Slice multi-index with xs (cross section)
north = df_multi.xs('North', level='region')
q1 = df_multi.xs(slice('2024-01', '2024-03'), level='date')

# Stack / Unstack (pivot between wide and long)
pivot = df.pivot_table(values='sales', index='region', columns='month')
long = pivot.stack().reset_index(name='sales')  # Wide → long
wide = long.pivot(index='region', columns='month', values='sales')  # Long → wide

# Melt (unpivot columns to rows)
melted = pd.melt(df, id_vars=['date', 'region'], value_vars=['product_a', 'product_b'],
                 var_name='product', value_name='sales')

# Explode (expand list values into separate rows)
df['tags'] = df['tags'].str.split(',')  # "a,b,c" → ["a","b","c"]
df_exploded = df.explode('tags')         # One row per tag
```

## Performance Optimization

```python
# Profile memory usage
df.info(memory_usage='deep')

# Reduce memory: optimize dtypes
def reduce_mem_usage(df: pd.DataFrame) -> pd.DataFrame:
    for col in df.columns:
        col_type = df[col].dtype
        
        if col_type != 'object':
            c_min, c_max = df[col].min(), df[col].max()
            
            if col_type.name.startswith('int'):
                for dtype in [np.int8, np.int16, np.int32, np.int64]:
                    if c_min > np.iinfo(dtype).min and c_max < np.iinfo(dtype).max:
                        df[col] = df[col].astype(dtype)
                        break
            elif col_type.name.startswith('float'):
                for dtype in [np.float32, np.float64]:
                    if c_min > np.finfo(dtype).min and c_max < np.finfo(dtype).max:
                        df[col] = df[col].astype(dtype)
                        break
        else:
            # Object → category if low cardinality
            if df[col].nunique() / len(df) < 0.5:
                df[col] = df[col].astype('category')
    
    return df

# Chunked processing for large files
chunks = []
for chunk in pd.read_csv('huge_file.csv', chunksize=100000):
    # Process each chunk
    processed = chunk[chunk['status'] == 'active'].groupby('region')['amount'].sum()
    chunks.append(processed)
result = pd.concat(chunks).groupby(level=0).sum()

# Vectorized string operations (much faster than .apply)
df['email_domain'] = df['email'].str.split('@').str[1]
df['name_clean'] = df['name'].str.strip().str.title()
df['has_promo'] = df['code'].str.startswith('PROMO')
```

## Merging Strategies

```python
# Fuzzy join (merge on similar but not exact strings)
# pip install fuzzymatch
import fuzzymatch

# When you have "Microsoft Corp" and "Microsoft Corporation"
result = fuzzymatch.join_left(
    left=df_orders,
    right=df_accounts,
    left_on='company_name',
    right_on='account_name',
    threshold=0.8  # 80% similarity required
)

# Time-based merge (asof merge) — match nearest timestamp
# Useful for joining trades with market prices
trades = pd.DataFrame({'time': pd.to_datetime(['10:00', '10:05', '10:12']), 'trade': [100,200,150]})
prices = pd.DataFrame({'time': pd.to_datetime(['10:00', '10:07', '10:15']), 'price': [50.0, 51.2, 50.8]})

merged = pd.merge_asof(trades.sort_values('time'), prices.sort_values('time'),
                        on='time', direction='backward')
# Each trade gets the most recent price before the trade time
```
