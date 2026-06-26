# MIS & Data Analytics

> **Excel, SQL, NumPy, Pandas, Power BI — from analyst to engineer**

**Category:** MIS  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is MIS & Data Analytics?

MIS converts raw data into actionable information. Know the full stack: Excel for quick analysis, SQL for databases, NumPy and Pandas for automation, Power BI for dashboards.

## Why MIS & Data Analytics?

XLOOKUP replaces VLOOKUP. Power Query replaces manual data cleaning. Power Pivot enables multi-table models.

---

## Learning Modules

### Module 01 — MIS Fundamentals
*Information systems thinking*

MIS converts raw data into actionable information. Know the full stack: Excel for quick analysis, SQL for databases, NumPy and Pandas for automation, Power BI for dashboards.

**Topics covered:**

- What is MIS and why it matters — 🟢 Beginner
- Data to Information to Insight — 🟢 Beginner
- KPI design principles — 🟡 Intermediate

### Module 02 — Excel & Advanced Excel
*XLOOKUP, Power Query, Pivot Tables*

XLOOKUP replaces VLOOKUP. Power Query replaces manual data cleaning. Power Pivot enables multi-table models.

**Topics covered:**

- XLOOKUP — replaces VLOOKUP — 🟢 Beginner
- Pivot Tables and Power Pivot — 🟡 Intermediate
- Power Query — ETL without code — 🟡 Intermediate
- SUMIFS, COUNTIFS — 🟡 Intermediate

```bash
=XLOOKUP(A2, Master!A:A, Master!C:C, \"Not Found\")
=SUMIFS(Revenue, Department, \"Sales\", Region, \"South\")
=FILTER(A2:D100, B2:B100=\"Sales\")
=UNIQUE(B2:B100)
```

### Module 03 — SQL for MIS
*Query databases directly*

SQL is the language of data. Window functions (RANK, LAG, LEAD) let you compare rows without joining. Query databases directly instead of waiting for IT to export to Excel.

**Topics covered:**

- SELECT, WHERE, GROUP BY, ORDER BY — 🟢 Beginner
- JOINs — 🟡 Intermediate
- CTEs — 🟡 Intermediate
- Window functions: RANK, LAG, LEAD — 🔴 Advanced

```bash
SELECT department, SUM(revenue) AS total
FROM sales GROUP BY department ORDER BY total DESC;

SELECT name, department, revenue,
    RANK() OVER (PARTITION BY department ORDER BY revenue DESC) AS rank
FROM sales;
```

### Module 04 — NumPy — Numerical Computing
*100x faster calculations, arrays, statistics*

NumPy is the foundation of all Python data science \u2014 Pandas, Matplotlib, Scikit-learn are built on NumPy. Essential for bulk calculations, performance targets, statistical summaries, and forecasting.

**Topics covered:**

- Why NumPy — 100x faster than Python lists — 🟢 Beginner
- ndarray — N-dimensional array — 🟢 Beginner
- Broadcasting and vectorised operations — 🟡 Intermediate
- Statistical functions — 🟡 Intermediate

```bash
import numpy as np
revenues = np.array([120000, 95000, 145000, 88000, 167000])
targets  = np.array([100000, 100000, 140000, 90000, 150000])
print(f'Mean: {revenues.mean():,.0f}')
print(f'P90:  {np.percentile(revenues, 90):,.0f}')
achievement = (revenues / targets * 100).round(1)
```

### Module 05 — Pandas — Data Manipulation
*DataFrames, groupby, merge, pivot tables*

Pandas is the most important library for MIS automation. A DataFrame is exactly like an Excel table. Everything done in Excel can be automated with Pandas \u2014 runs automatically, handles thousands of files.

**Topics covered:**

- DataFrame — Excel sheet in Python — 🟢 Beginner
- Filter, sort, groupby, aggregate — 🟡 Intermediate
- merge — replaces VLOOKUP — 🟡 Intermediate
- pivot_table — 🟡 Intermediate

```bash
import pandas as pd
df = pd.read_excel('sales.xlsx')
summary = df.groupby('Department').agg(
    Revenue=('Revenue','sum'), Headcount=('Name','count')
).reset_index()
merged = pd.merge(df, pd.read_excel('targets.xlsx'), on='Department', how='left')
merged['Achv_%'] = (merged['Revenue']/merged['Target']*100).round(1)
```

### Module 06 — Power BI
*Dashboards, DAX, semantic model, sharing*

Power BI is Microsoft BI platform. Build semantic models reusable across many reports. CALCULATE is the most important DAX function. Publish to Power BI Service for scheduled refresh.

**Topics covered:**

- Data model and relationships — 🟡 Intermediate
- DAX: CALCULATE, TOTALYTD, DIVIDE — 🔴 Advanced
- Key visuals — 🟢 Beginner
- Power BI Service — scheduled refresh — 🟡 Intermediate

```bash
Total Revenue = SUM(Sales[Revenue])
Sales_South = CALCULATE([Total Revenue], Region[Region]=\"South\")
Revenue YTD = TOTALYTD([Total Revenue], Date[Date])
Achievement % = DIVIDE([Total Revenue], [Total Target], 0) * 100
```

---

## Production Example

```bash
# MIS Roadmap: Excel+SQL+Power BI \u2192 NumPy+Pandas \u2192 Plotly+Airflow
# Libraries: pandas, numpy, openpyxl, plotly, sqlalchemy
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is MIS & Data Analytics and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does MIS & Data Analytics work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of MIS & Data Analytics?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in MIS & Data Analytics?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with MIS & Data Analytics?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe MIS & Data Analytics in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for MIS & Data Analytics?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does MIS & Data Analytics compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain MIS Fundamentals in MIS & Data Analytics."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Excel & Advanced Excel in MIS & Data Analytics."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Power BI Documentation](https://learn.microsoft.com/en-us/power-bi/)
- [NumPy Documentation](https://numpy.org/doc/stable/)
- [Pandas Documentation](https://pandas.pydata.org/docs/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*