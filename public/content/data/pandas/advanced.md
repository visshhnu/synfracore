# Pandas — Advanced

## Production Data Pipelines

```python
from dataclasses import dataclass
from typing import Callable
import pandas as pd
import logging

@dataclass
class PipelineStep:
    name: str
    transform: Callable[[pd.DataFrame], pd.DataFrame]
    validate: Callable[[pd.DataFrame], bool] = None

class DataPipeline:
    def __init__(self, steps: list[PipelineStep]):
        self.steps = steps
        self.log = logging.getLogger(__name__)
    
    def run(self, df: pd.DataFrame) -> pd.DataFrame:
        for step in self.steps:
            self.log.info(f"Running step: {step.name}, shape: {df.shape}")
            try:
                df = step.transform(df)
                if step.validate and not step.validate(df):
                    raise ValueError(f"Validation failed after step: {step.name}")
            except Exception as e:
                self.log.error(f"Pipeline failed at step {step.name}: {e}")
                raise
        return df

# Define pipeline
pipeline = DataPipeline([
    PipelineStep("load", lambda df: df.dropna(subset=['id', 'date'])),
    PipelineStep("clean", lambda df: df.assign(
        email=df['email'].str.lower().str.strip(),
        amount=pd.to_numeric(df['amount'], errors='coerce')
    )),
    PipelineStep("filter", lambda df: df[df['amount'] > 0],
                 validate=lambda df: len(df) > 0),
    PipelineStep("enrich", lambda df: df.merge(
        pd.read_csv('regions.csv'), on='country_code', how='left'
    )),
])

result = pipeline.run(pd.read_csv('raw_data.csv'))
```

## Pandas Cheatsheet + Interview

```python
# ── ESSENTIAL OPERATIONS ──────────────────────────────────
df.shape / df.dtypes / df.info() / df.describe()
df.head(10) / df.tail(5) / df.sample(100)
df.value_counts() / df.nunique()

# Selection
df['col'] / df[['col1','col2']]
df[df['col'] > 100]
df.loc[mask, ['col1','col2']]     # Label-based
df.iloc[0:5, 2:4]                 # Position-based
df.query("col > 100 and region == @var")  # @ for variables

# Cleaning
df.isnull().sum() / df.dropna() / df.fillna(value)
df.drop_duplicates(subset=['id'])
df['col'].astype('category')
pd.to_datetime(df['date'])
pd.to_numeric(df['num'], errors='coerce')

# GroupBy
df.groupby('col')['val'].agg(['sum','mean','count'])
df.groupby('col').agg(total=('val','sum'), avg=('val','mean'))
df['rank'] = df.groupby('group')['score'].rank(ascending=False)

# Merge
pd.merge(df1, df2, on='key', how='left')
pd.merge(df1, df2, left_on='id', right_on='user_id')
pd.concat([df1, df2], ignore_index=True)

# Time series
df.set_index('date').resample('ME')['sales'].sum()
df['7d_avg'] = df['sales'].rolling(7).mean()
df['pct_change'] = df['sales'].pct_change()

# Key interview questions:
# Q: When use .loc vs .iloc?
# A: .loc uses labels/conditions; .iloc uses integer positions
# 
# Q: Difference between copy() and view?
# A: Operations on slices may be views (changing modifies original)
#    Use .copy() to ensure independence: df2 = df[mask].copy()
#
# Q: How to speed up pandas?
# A: Vectorized ops > apply > iterrows (never use iterrows for large data)
#    Use category dtype for low-cardinality strings
#    Read with correct dtypes upfront
#    Consider polars or dask for very large data
```
