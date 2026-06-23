# Tableau Certification Guide

## Certifications Available

| Cert | Provider | Cost |
|------|----------|------|
| **Tableau Desktop Specialist** | Salesforce | $250 |
| **Tableau Desktop Certified Associate** | Salesforce | $500 |
| **Tableau Server Certified Associate** | Salesforce | $500 |

Desktop Specialist: multiple choice. Certified Associate: practical tasks + MCQ.

---

## Core Skills & Commands

```
-- Tableau Desktop Specialist key topics

CONNECT: File (CSV, Excel), Server (SQL, BigQuery), Cloud (S3)
DIMENSIONS vs MEASURES:
  Dimensions: categorical (blue pills) — Region, Category, Product
  Measures: quantitative (green pills) — Sales, Profit, Quantity

CHART TYPES (Show Me panel):
  Bar chart: categorical comparison
  Line chart: trend over time
  Scatter plot: correlation between two measures
  Map: geographic data (must have geographic role)
  Treemap: part-to-whole + size comparison
  Heatmap: patterns in two categorical dimensions

CALCULATED FIELDS:
  [Profit Ratio] = SUM([Profit]) / SUM([Sales])
  [Above Average] = IF SUM([Sales]) > AVG(SUM([Sales])) THEN "Yes" ELSE "No" END

LOD EXPRESSIONS (Level of Detail):
  {FIXED [Region] : SUM([Sales])}          -- fixed dimension
  {INCLUDE [Order ID] : COUNT([Product])} -- add dimension
  {EXCLUDE [Region] : AVG([Sales])}        -- remove dimension

FILTERS (order of operations):
  Extract → Data Source → Context → Dimension → Measure → Table Calc

PERFORMANCE:
  Use extracts (.hyper) instead of live connections
  Reduce marks (<5000) | Index high-cardinality fields
  Context filters reduce scope for subsequent filters
```

---

## Study Resources

- **Tableau Public** (free, build and share dashboards)
- **Tableau Training Videos** (official, tableau.com/learn)
- **Superdata School** — Tableau prep resources
- **Makeover Monday** — weekly data viz practice challenge

## Revision Notes

```
TABLEAU SPECIALIST KEY TOPICS:
  Dimensions (blue/categorical) vs Measures (green/quantitative)
  Show Me panel: choose chart type by data shape
  Calculated fields: basic formulas + IF/THEN/ELSE
  LOD expressions: FIXED/INCLUDE/EXCLUDE (advanced)
  Filters: data source → context → dimension → measure → table calc
  Dashboard: combine sheets + layout containers + actions
  Performance: extracts > live connection | fewer marks = faster
```
