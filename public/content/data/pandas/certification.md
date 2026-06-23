# Pandas Certification Guide

## Certifications Available

| Cert / Course | Provider | Cost |
|---------------|----------|------|
| **Kaggle Pandas Course** | Kaggle | Free |
| **DataCamp Data Analyst with Python** | DataCamp | ~$300/yr |
| **IBM Data Analyst Professional** | Coursera | ~$300 |
| **Associate Data Analyst in SQL+Python** | DataCamp | ~$300/yr |

No standalone Pandas cert — assessed as part of Python/data analyst tracks.

---

## Core Skills & Commands

```python
import pandas as pd

# Loading data
df = pd.read_csv("data.csv")
df = pd.read_excel("data.xlsx")
df = pd.read_json("data.json")

# Exploration
df.head() | df.info() | df.describe() | df.shape
df.dtypes | df.isnull().sum() | df.nunique()

# Selection
df["col"]              # Series
df[["col1","col2"]]    # DataFrame
df.iloc[0:5, 1:3]      # by position
df.loc[df["age"] > 30] # by label/condition
df.query("age > 30 and city == 'Mumbai'")  # SQL-like

# Cleaning
df.dropna() | df.fillna(0) | df.drop_duplicates()
df["col"] = df["col"].str.strip().str.lower()
df["date"] = pd.to_datetime(df["date"])
df = df.rename(columns={"old": "new"})

# Aggregation
df.groupby("city")["sales"].sum()
df.groupby("city").agg({"sales": "sum", "orders": "count"})
df.pivot_table(values="sales", index="region", columns="product", aggfunc="sum")

# Merging
pd.merge(df1, df2, on="id", how="left")
pd.concat([df1, df2], ignore_index=True)
```

---

## Study Resources

- **Kaggle Pandas Course** (free, best starting point)
- **Pandas documentation** (pandas.pydata.org/docs) — official reference
- **Real Python Pandas tutorials** — practical examples
- **DataCamp Pandas skill track** — structured learning path

## Revision Notes

```
PANDAS ESSENTIALS:
  Load: read_csv/excel/json | Explore: head/info/describe/dtypes
  Select: df["col"] | df.loc[condition] | df.iloc[rows, cols]
  Clean: dropna/fillna/drop_duplicates/str.strip/astype
  Aggregate: groupby().agg() | pivot_table | value_counts
  Merge: pd.merge(df1, df2, on="key", how="left/right/inner/outer")
  Apply: df["col"].apply(func) | df.applymap(func)
```
