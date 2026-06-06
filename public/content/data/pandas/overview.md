# Pandas — Data Analytics with Python

Pandas is the foundational Python library for data analysis. It provides DataFrame and Series data structures that make working with tabular data fast, expressive, and flexible.

## Why Pandas?

```python
# Without pandas — painful
data = []
with open('sales.csv') as f:
    for line in f:
        data.append(line.strip().split(','))
headers = data[0]
total = sum(float(row[3]) for row in data[1:] if row[2] == 'Electronics')

# With pandas — 2 lines
import pandas as pd
df = pd.read_csv('sales.csv')
total = df[df['category'] == 'Electronics']['revenue'].sum()
```

## Installation & Setup

```bash
pip install pandas numpy matplotlib seaborn openpyxl xlrd
```

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Check version
print(pd.__version__)

# Display settings
pd.set_option('display.max_columns', 50)
pd.set_option('display.max_rows', 100)
pd.set_option('display.float_format', '{:.2f}'.format)
```

## Reading Data

```python
# CSV
df = pd.read_csv('data.csv')
df = pd.read_csv('data.csv',
    sep=';',                         # Custom delimiter
    header=0,                        # Row to use as header
    index_col='id',                  # Set column as index
    parse_dates=['created_at'],      # Parse date columns
    usecols=['name', 'revenue'],     # Only load these columns
    dtype={'revenue': float},        # Force column types
    na_values=['N/A', 'NULL', ''],   # Treat as NaN
    encoding='utf-8',
    nrows=1000                       # Only read first 1000 rows
)

# Excel
df = pd.read_excel('report.xlsx', sheet_name='Q1 Sales')
dfs = pd.read_excel('report.xlsx', sheet_name=None)  # All sheets → dict

# JSON
df = pd.read_json('data.json')
df = pd.read_json('data.json', orient='records')

# SQL Database
from sqlalchemy import create_engine
engine = create_engine('postgresql://user:pass@host:5432/mydb')
df = pd.read_sql("SELECT * FROM orders WHERE status = 'completed'", engine)
df = pd.read_sql_table('orders', engine)

# Parquet (fast columnar format)
df = pd.read_parquet('data.parquet')

# Sample large files
df = pd.read_csv('huge.csv', nrows=100)         # First 100 rows
df = pd.read_csv('huge.csv', skiprows=range(1, 1000))  # Skip rows 1-999
```

## Exploring Data

```python
df.shape                    # (rows, columns)
df.dtypes                   # Column data types
df.info()                   # Summary with dtypes and nulls
df.describe()               # Statistics for numeric columns
df.describe(include='all')  # Including categorical

df.head(10)                 # First 10 rows
df.tail(5)                  # Last 5 rows
df.sample(5)                # Random 5 rows

df.columns.tolist()         # List of column names
df.index                    # Index info
df['revenue'].unique()      # Unique values
df['status'].value_counts() # Frequency count
df['revenue'].nunique()     # Number of unique values

# Missing values
df.isnull().sum()           # Null count per column
df.isnull().sum() / len(df) # Null percentage
df[df['revenue'].isnull()]  # Rows with null revenue
```

## Selecting and Filtering

```python
# Select columns
df['revenue']                           # Series
df[['name', 'revenue', 'date']]        # DataFrame
df.iloc[:, 0:3]                         # First 3 columns by position
df.loc[:, 'name':'revenue']            # Columns by label range

# Select rows
df.iloc[0]                              # First row by position
df.iloc[5:10]                           # Rows 5-9
df.loc[100]                             # Row by index label

# Filter rows
df[df['revenue'] > 1000]
df[df['status'] == 'completed']
df[(df['revenue'] > 1000) & (df['region'] == 'West')]  # AND
df[(df['status'] == 'A') | (df['status'] == 'B')]       # OR
df[~(df['status'] == 'cancelled')]                       # NOT
df[df['category'].isin(['Electronics', 'Clothing'])]    # In list
df[df['name'].str.contains('Apple', na=False)]          # String contains
df.query("revenue > 1000 and region == 'West'")         # SQL-like syntax

# Select by condition and columns
df.loc[df['revenue'] > 1000, ['name', 'revenue', 'region']]
```

## Data Cleaning

```python
# Handle missing values
df.dropna()                              # Drop rows with ANY null
df.dropna(subset=['revenue', 'date'])   # Drop rows with null in these cols
df.dropna(thresh=5)                     # Keep rows with at least 5 non-null
df.fillna(0)                            # Fill all nulls with 0
df['revenue'].fillna(df['revenue'].mean())  # Fill with mean
df.fillna(method='ffill')               # Forward fill
df.fillna(method='bfill')               # Backward fill

# Data types
df['date'] = pd.to_datetime(df['date'])
df['revenue'] = pd.to_numeric(df['revenue'], errors='coerce')  # Bad → NaN
df['id'] = df['id'].astype(str)
df['category'] = df['category'].astype('category')  # Memory efficient

# String cleaning
df['name'] = df['name'].str.strip()        # Remove whitespace
df['name'] = df['name'].str.lower()        # Lowercase
df['name'] = df['name'].str.replace('Inc.', 'Inc', regex=False)
df['email'] = df['email'].str.extract(r'(\w+@\w+\.\w+)')  # Extract pattern

# Duplicates
df.duplicated().sum()                       # Count duplicates
df.drop_duplicates()                        # Remove all duplicates
df.drop_duplicates(subset=['email'])        # Unique by email
df.drop_duplicates(subset=['email'], keep='last')  # Keep last occurrence

# Rename columns
df.rename(columns={'old_name': 'new_name', 'qty': 'quantity'}, inplace=True)
df.columns = df.columns.str.lower().str.replace(' ', '_')  # Standardize all
```

## Aggregation & GroupBy

```python
# Basic aggregations
df['revenue'].sum()
df['revenue'].mean()
df['revenue'].median()
df.groupby('region')['revenue'].sum()
df.groupby('region')['revenue'].agg(['sum', 'mean', 'count'])

# Multiple groupby
df.groupby(['region', 'category']).agg(
    total_revenue=('revenue', 'sum'),
    avg_order=('revenue', 'mean'),
    order_count=('id', 'count'),
    max_order=('revenue', 'max')
).reset_index()

# Pivot table
pivot = pd.pivot_table(df,
    values='revenue',
    index='region',
    columns='category',
    aggfunc='sum',
    fill_value=0
)

# Rolling window (moving average)
df['revenue_7d_avg'] = df['revenue'].rolling(window=7).mean()
df['revenue_cumsum'] = df['revenue'].cumsum()

# Resample time series
df = df.set_index('date')
df.resample('M')['revenue'].sum()          # Monthly totals
df.resample('Q')['revenue'].sum()          # Quarterly
df.resample('W').agg({'revenue': 'sum', 'orders': 'count'})
```

## Merging and Joining

```python
# Merge (like SQL JOIN)
result = pd.merge(orders, customers,
    left_on='customer_id',
    right_on='id',
    how='left'       # left, right, inner, outer
)

# Multiple key join
result = pd.merge(orders, products,
    on=['product_id', 'warehouse_id']
)

# Concatenate
combined = pd.concat([df_q1, df_q2, df_q3, df_q4], ignore_index=True)
combined = pd.concat([df1, df2], axis=1)  # Side by side
```

## Apply and Lambda

```python
# Apply function to each value
df['revenue_usd'] = df['revenue'].apply(lambda x: x * 1.2)

# Apply to each row
df['full_name'] = df.apply(
    lambda row: f"{row['first_name']} {row['last_name']}",
    axis=1
)

# Vectorized (faster than apply)
df['discounted'] = np.where(df['revenue'] > 1000, df['revenue'] * 0.9, df['revenue'])

# Cut into bins
df['revenue_tier'] = pd.cut(df['revenue'],
    bins=[0, 100, 500, 1000, float('inf')],
    labels=['Low', 'Medium', 'High', 'Premium']
)
```

## Export Data

```python
df.to_csv('output.csv', index=False)
df.to_excel('output.xlsx', index=False, sheet_name='Analysis')
df.to_parquet('output.parquet')
df.to_json('output.json', orient='records', indent=2)
df.to_sql('table_name', engine, if_exists='replace', index=False)
```

## Interview Questions

**What is the difference between `loc` and `iloc`?**
`loc` selects by label — row index labels and column names. `iloc` selects by integer position — row and column numbers. If your index is integers (0, 1, 2...) they look similar, but differ when index is non-numeric. `df.loc[5, 'revenue']` selects row with index label 5 and column named 'revenue'. `df.iloc[5, 3]` selects the 6th row and 4th column regardless of labels.

**How do you handle memory issues with large DataFrames?**
Several strategies: use `dtype` parameter when reading to downcast (int64→int32, float64→float32), use `usecols` to only load needed columns, use `category` dtype for low-cardinality string columns (saves 10-100×), process in chunks with `chunksize` parameter in `read_csv`, use Parquet format instead of CSV (columnar, compressed), or switch to Dask for out-of-core computation on data larger than RAM.
