# Pandas — Interview Questions

**What is the difference between .loc and .iloc?**
`.loc` is label-based — you select by index labels or boolean conditions. `df.loc[5]` returns the row with index label 5 (which may not be the 6th row if the index is custom). `df.loc[df['age'] > 25, ['name','email']]` selects rows by condition and specific columns by name. `.iloc` is position-based (integer location) — `df.iloc[5]` always returns the 6th row regardless of index, `df.iloc[0:5, 2:4]` returns rows 0-4 and columns 2-3. Use `.loc` for real-world data selection with meaningful index/conditions; use `.iloc` for positional slicing.

**What causes a SettingWithCopyWarning and how do you fix it?**
It happens when you modify a slice that may be a view of the original DataFrame rather than a copy. `df[df['age'] > 25]['name'] = 'Adult'` — this might modify a temporary copy, not the original. Fix by either using `.loc` directly on the original: `df.loc[df['age'] > 25, 'name'] = 'Adult'`, or explicitly create a copy first: `subset = df[df['age'] > 25].copy()`, then modify `subset`. The warning is Pandas telling you the behavior may be unpredictable.

**When would you use .apply() vs vectorized operations?**
Vectorized operations (using Series/DataFrame built-in methods and numpy) are 10-100× faster because they run in compiled C/Fortran code. Use them whenever possible: `df['total'] = df['price'] * df['qty']` (never use `.apply` for this). Use `.apply()` for complex row/column logic that can't be expressed vectorially: `df.apply(lambda row: complex_business_logic(row['a'], row['b']), axis=1)`. Never use `.iterrows()` on large DataFrames — it converts each row to a Series (very slow). If `.apply()` is still too slow, use Cython via `@numba.jit` or switch to Polars.

**How do you handle a DataFrame with 10 million rows that doesn't fit in memory?**
Multiple strategies: use `pd.read_csv(chunksize=100000)` to process in chunks, aggregating results; use `dtype` parameter to read with memory-efficient types (int8 instead of int64, category instead of object); filter early with `usecols` to read only needed columns; use PyArrow backend (newer pandas versions) or switch to Polars (columnar, lazy evaluation, much more memory-efficient); use Dask for distributed pandas-like operations across multiple cores/machines; use SQLite or DuckDB to query CSV/Parquet files directly without loading into memory.

**What is the difference between groupby + agg and groupby + transform?**
`agg` collapses each group to one row — you get a smaller DataFrame with one row per group. `transform` returns a DataFrame with the same shape as the original — each row gets the group's aggregate value. Use `agg` when you want group summaries. Use `transform` when you want to add group statistics back to the original rows: `df['region_avg'] = df.groupby('region')['sales'].transform('mean')` adds the region average to each row, enabling `df['pct_of_avg'] = df['sales'] / df['region_avg']` without needing a join.
