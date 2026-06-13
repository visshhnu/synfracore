# Tableau — Advanced + Interview + Cheatsheet

## Performance Optimization

```
1. Data source optimization:
   Use extracts (TDE/Hyper) instead of live connections for large data
   Filter at source to reduce rows
   Aggregate in database before connecting
   Use custom SQL only when necessary (prevents query folding)

2. Dashboard optimization:
   Limit visualizations per dashboard (8-12 max)
   Use layout containers for responsive design
   Minimize calculated fields on large datasets
   Use context filters (apply before other filters)

3. Calculation optimization:
   FIXED LOD > table calculations > row-level calculations
   Use boolean calculations for filtering (true/false is fast)
   Avoid nested IF statements with many conditions
   
4. Tableau Server/Cloud:
   Extract refresh schedules (off-peak hours)
   Workbook performance recorder (Tools → Record Performance)
   VizQL Process monitor
```

## Tableau Interview + Cheatsheet

```
# ── KEY INTERVIEW QUESTIONS ───────────────────────────────
Q: What is the difference between Dimensions and Measures?
A: Dimensions are qualitative/categorical (Region, Product, Date as discrete).
   They create headers, segments, and discrete points.
   Measures are quantitative (Sales, Profit, Count).
   They produce axes and aggregations (SUM, AVG, COUNT).
   Tableau puts blue pill = discrete/dimension, green = continuous/measure.

Q: What are LOD expressions and when would you use them?
A: LOD (Level of Detail) expressions let you compute aggregations at
   different granularities than the current view.
   FIXED: ignore current view, compute at specified level
   INCLUDE: add more detail than current view
   EXCLUDE: less detail than current view
   Use when you need "X as % of total" or "customer's first order date"
   without changing the view's granularity.

Q: Difference between context filter and regular filter?
A: Regular filters execute in parallel, each filtering the full dataset.
   Context filter runs first and creates a temporary table.
   Subsequent filters operate on that smaller table — much faster.
   Use context filters for: top N filters, reference lines, when you have
   multiple filters that should combine sequentially.

Q: How do you create a year-over-year comparison?
A: Method 1: Dual-axis chart with year as color
   Method 2: Calculated field: LOOKUP(SUM([Sales]),-1) for table calc
   Method 3: Use the built-in Quick Table Calculation → Year over Year
   Method 4: Date parameter + IF YEAR([Date]) = [Selected Year] THEN...

# ── QUICK REFERENCE ───────────────────────────────────────
Aggregation functions: SUM, AVG, COUNT, COUNTD, MIN, MAX, MEDIAN, ATTR
String: UPPER, LOWER, TRIM, LEN, CONTAINS, LEFT, RIGHT, MID, SPLIT, REPLACE
Date: YEAR, MONTH, DAY, TODAY, NOW, DATEDIFF, DATEADD, DATETRUNC
Logic: IF/ELSEIF/ELSE/END, IIF, CASE/WHEN/END, ISNULL, IFNULL, ZN
LOD: {FIXED dim:agg}, {INCLUDE dim:agg}, {EXCLUDE dim:agg}
Table calcs: WINDOW_SUM, RUNNING_SUM, LOOKUP, RANK, PERCENTILE, TOTAL
```
