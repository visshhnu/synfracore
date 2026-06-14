# Pandas -- Portfolio Projects

---

## Project 1: E-Commerce Sales Analysis

**Level:** Beginner | **Time:** 1-2 days | **GitHub:** `pandas-sales-analysis`

Complete sales data analysis pipeline: load messy data, clean it, analyze, and produce executive-ready insights.

```python
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Load and inspect
df = pd.read_csv("sales_data.csv", parse_dates=["order_date"])
print(f"Shape: {df.shape}")
print(f"Missing values:
{df.isnull().sum()}")
print(f"Duplicates: {df.duplicated().sum()}")

# Clean
df["quantity"] = df["quantity"].fillna(df.groupby("product")["quantity"].transform("median"))
df["revenue"] = df["quantity"] * df["unit_price"]
df = df[df["revenue"] > 0]  # Remove returns
df["month"] = df["order_date"].dt.to_period("M")
df["region"] = df["region"].str.strip().str.upper()

# Key analyses
monthly_revenue = df.resample("ME", on="order_date")["revenue"].sum()

product_performance = df.groupby("product").agg(
    revenue=("revenue", "sum"),
    orders=("order_id", "nunique"),
    units=("quantity", "sum"),
    avg_order=("revenue", "mean")
).sort_values("revenue", ascending=False)

region_pivot = df.pivot_table(
    values="revenue", index="region",
    columns=df["order_date"].dt.quarter,
    aggfunc="sum", fill_value=0
)

# MoM growth
monthly_revenue_df = monthly_revenue.reset_index()
monthly_revenue_df["mom_growth"] = monthly_revenue_df["revenue"].pct_change() * 100

print("
Top 10 Products:")
print(product_performance.head(10))

print("
Monthly Growth Rate:")
print(monthly_revenue_df[["order_date", "revenue", "mom_growth"]].tail(6))
```

**Steps:** Load messy CSV, document all cleaning decisions, 10 analyses, 5 visualizations, executive summary

---

## Project 2: Real-Time Data Pipeline with Streaming

**Level:** Intermediate | **Time:** 2-3 days | **GitHub:** `pandas-data-pipeline`

ETL pipeline: extract from multiple sources, transform with Pandas, load to PostgreSQL.

```python
import pandas as pd
import sqlalchemy
from pathlib import Path
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class DataPipeline:
    def __init__(self, db_url: str):
        self.engine = sqlalchemy.create_engine(db_url)

    def extract(self, source_dir: Path) -> dict:
        dataframes = {}
        for csv_file in source_dir.glob("*.csv"):
            df = pd.read_csv(csv_file, parse_dates=True, infer_datetime_format=True)
            logger.info(f"Loaded {csv_file.name}: {df.shape}")
            dataframes[csv_file.stem] = df
        return dataframes

    def transform(self, dataframes: dict) -> pd.DataFrame:
        orders = dataframes["orders"]
        products = dataframes["products"]
        customers = dataframes["customers"]

        enriched = orders.merge(
            products[["product_id", "name", "category", "cost"]],
            on="product_id"
        ).merge(
            customers[["customer_id", "region", "tier"]],
            on="customer_id"
        )

        enriched["gross_profit"] = enriched["revenue"] - enriched["cost"] * enriched["quantity"]
        enriched["profit_margin"] = enriched["gross_profit"] / enriched["revenue"]

        enriched = enriched.dropna(subset=["revenue", "quantity"])
        enriched = enriched[enriched["quantity"] > 0]

        return enriched

    def load(self, df: pd.DataFrame, table_name: str):
        df.to_sql(table_name, self.engine,
                  if_exists="replace", index=False, chunksize=1000)
        logger.info(f"Loaded {len(df)} rows to {table_name}")

pipeline = DataPipeline("postgresql://localhost/analytics")
dataframes = pipeline.extract(Path("./data"))
transformed = pipeline.transform(dataframes)
pipeline.load(transformed, "enriched_orders")
```

**Steps:** Multi-source extraction, transformation with audit log, PostgreSQL loading, schedule with cron, data quality checks

---

## Portfolio Checklist
- [ ] Data cleaning decisions documented in README
- [ ] Analysis results surprising or insightful (not just "sales went up")
- [ ] Visualizations exported as PNG (include in README)
- [ ] Pipeline runs end-to-end with `python pipeline.py`
- [ ] Can explain every transformation decision in an interview
