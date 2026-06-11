# Pandas & Python Analytics — Fundamentals

## Core Operations

```python
import pandas as pd
import numpy as np

# Load data
df = pd.read_csv('sales.csv', parse_dates=['date'])
df = pd.read_excel('data.xlsx', sheet_name='Sheet1')
df = pd.read_json('data.json')
df = pd.read_sql("SELECT * FROM orders WHERE date > '2024-01-01'", conn)

# Quick exploration
df.shape          # (rows, cols)
df.dtypes         # column types
df.info()         # non-null counts, memory usage
df.describe()     # statistics for numeric columns
df.head(10)       # first 10 rows
df.sample(5)      # random 5 rows
df.value_counts() # frequency of values in a Series
df.nunique()      # count unique values per column
```

## Selecting and Filtering

```python
# Select columns
df['sales']              # Single column (Series)
df[['date', 'sales']]    # Multiple columns (DataFrame)

# Filter rows — use & | ~ for boolean operations (not and/or)
df[df['sales'] > 1000]
df[(df['region'] == 'North') & (df['sales'] > 500)]
df[df['status'].isin(['active', 'pending'])]
df[df['name'].str.contains('Alice', na=False)]
df[df['date'] >= '2024-01-01']

# loc (label-based) and iloc (position-based)
df.loc[df['region'] == 'North', ['date', 'sales']]    # rows + specific cols
df.iloc[0:5, 2:4]                                      # first 5 rows, cols 2-3
df.loc[5, 'sales'] = 999                               # assign by label

# Query method (readable for complex filters)
df.query("region == 'North' and sales > @threshold")
```

## Data Cleaning

```python
# Missing values
df.isnull().sum()                          # count nulls per column
df.dropna()                                # drop rows with any null
df.dropna(subset=['sales', 'region'])      # drop if specific cols null
df.fillna({'sales': 0, 'region': 'Unknown'})
df['sales'].fillna(df['sales'].median(), inplace=True)
df.ffill()                                 # forward fill (time series)

# Duplicates
df.duplicated().sum()
df.drop_duplicates(subset=['order_id'], keep='first')

# Data type conversion
df['date'] = pd.to_datetime(df['date'])
df['amount'] = pd.to_numeric(df['amount'], errors='coerce')  # NaN on error
df['category'] = df['category'].astype('category')  # memory efficient

# String cleaning
df['email'] = df['email'].str.lower().str.strip()
df['phone'] = df['phone'].str.replace(r'\D', '', regex=True)  # digits only
df[['first', 'last']] = df['full_name'].str.split(' ', n=1, expand=True)
```

## GroupBy and Aggregation

```python
# Basic groupby
df.groupby('region')['sales'].sum()
df.groupby(['region', 'product'])['sales'].agg(['sum', 'mean', 'count'])

# Custom aggregation with named results
result = df.groupby('region').agg(
    total_sales=('sales', 'sum'),
    avg_sales=('sales', 'mean'),
    order_count=('order_id', 'count'),
    top_product=('product', lambda x: x.mode()[0])  # most common
).reset_index()

# Transform — add group stats back to original df
df['region_avg'] = df.groupby('region')['sales'].transform('mean')
df['sales_vs_avg'] = df['sales'] / df['region_avg']

# Pivot table
pivot = df.pivot_table(
    values='sales',
    index='region',
    columns='month',
    aggfunc='sum',
    fill_value=0
)
```

## Merging and Joining

```python
# Merge (like SQL JOIN)
result = pd.merge(orders, customers, on='customer_id', how='left')
result = pd.merge(orders, products, 
                  left_on='product_id', right_on='id', 
                  how='inner',
                  suffixes=('_order', '_product'))

# Concatenate (stack DataFrames)
all_data = pd.concat([df_jan, df_feb, df_mar], ignore_index=True)
df_wide = pd.concat([df_sales, df_costs], axis=1)  # side by side

# Merge on index
df.merge(lookup_table, left_index=True, right_index=True)
```

## Time Series

```python
# Date operations
df['month'] = df['date'].dt.month
df['year'] = df['date'].dt.year
df['day_of_week'] = df['date'].dt.day_name()
df['quarter'] = df['date'].dt.quarter

# Resample (group by time period)
monthly = df.set_index('date').resample('ME')['sales'].sum()
weekly_avg = df.set_index('date').resample('W')['sales'].mean()

# Rolling windows
df['7d_avg'] = df['sales'].rolling(window=7).mean()
df['30d_max'] = df['sales'].rolling(window=30).max()
df['pct_change'] = df['sales'].pct_change()           # day over day
df['30d_growth'] = df['sales'].pct_change(periods=30) # 30-day growth
```

## Apply and Lambda

```python
# Apply function to each row or column
df['revenue'] = df.apply(lambda row: row['qty'] * row['price'] * 
                         (1 - row['discount']), axis=1)

# Apply to series (faster than row apply)
df['name_clean'] = df['name'].apply(lambda x: x.title().strip())

# Map for simple value replacement
df['status_label'] = df['status'].map({
    1: 'active', 2: 'pending', 3: 'cancelled'
})

# Vectorized operations are MUCH faster than apply
# SLOW:
df['discounted'] = df['price'].apply(lambda x: x * 0.9)
# FAST:
df['discounted'] = df['price'] * 0.9
```
