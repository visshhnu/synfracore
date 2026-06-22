# Pandas Interview Questions

## Core Concepts

**Q: DataFrame operations — select, filter, transform.**

```python
import pandas as pd

# Create / Load
df = pd.read_csv("data.csv")
df = pd.DataFrame({"name": ["Alice","Bob"], "age": [30, 25]})

# Select
df["name"]               # Series
df[["name", "age"]]      # DataFrame
df.iloc[0]               # Row by integer position
df.loc[df["age"] > 25]   # Row by condition

# Filter
df[df["age"] > 25]
df.query("age > 25 and name != 'Bob'")

# Transform
df["age_group"] = df["age"].apply(lambda x: "senior" if x >= 30 else "junior")
df["full_name"] = df["first"] + " " + df["last"]
```

---

**Q: GroupBy and aggregation.**

```python
# GroupBy: like SQL GROUP BY
df.groupby("department")["salary"].mean()
df.groupby(["dept","level"]).agg({"salary": ["mean","max","count"]})

# Pivot table
pd.pivot_table(df, values="sales", index="region", columns="product", aggfunc="sum")

# Apply custom function
df.groupby("dept").apply(lambda x: x.nlargest(3, "salary"))  # Top 3 per dept
```

---

**Q: Merging and joining DataFrames.**

```python
# Merge (like SQL JOIN)
result = pd.merge(orders, users, left_on="user_id", right_on="id", how="left")

# Concat (stack rows or columns)
combined = pd.concat([df1, df2], ignore_index=True)     # Stack rows
wide = pd.concat([df1, df2], axis=1)                     # Add columns
```

---

**Q: Performance best practices.**

```python
# Vectorised operations > apply > loops
# Slow: df.apply(lambda x: x["a"] * x["b"])
# Fast: df["a"] * df["b"]  (vectorised)

# Efficient data types
df["category"] = df["category"].astype("category")  # String with few unique values
df["int_col"] = df["int_col"].astype("int32")        # vs int64

# Chunked reading for large files
for chunk in pd.read_csv("big_file.csv", chunksize=10000):
    process(chunk)

# Use numpy where for conditionals
df["flag"] = np.where(df["score"] > 90, "high", "normal")
```

## Revision Notes
```
PANDAS CORE: DataFrame (2D) | Series (1D)
SELECTION: df["col"] | df[["c1","c2"]] | df.loc[condition] | df.iloc[pos]
FILTER: df[df["col"] > value] | df.query("col > value")

GROUPBY: df.groupby("col")["val"].agg({"mean","max","count"})
MERGE: pd.merge(left, right, on="key", how="left/inner/outer")
CONCAT: pd.concat([df1, df2]) = stack rows

PERFORMANCE:
Vectorised ops > apply > loops
astype("category") for low-cardinality strings
Chunked reading for large files
np.where for conditional column creation
```
