# Tableau — Interview Questions

**What is the difference between a dimension and a measure in Tableau?**
Dimension: qualitative field used to slice/categorize data (Customer Name, Region, Product Category, Date). Appears as a label. By default, adds a header to a view. Measure: quantitative field that can be aggregated (Sales, Profit, Quantity). Tableau aggregates measures (SUM, AVG, etc.) by default. Discrete vs Continuous: Dimensions are blue (discrete), Measures are green (continuous). You can convert — making a measure discrete turns it into a header (each distinct value gets a column/row).

**What is a LOD expression and when would you use one?**
LOD (Level of Detail) expressions compute aggregations at a specific level of detail regardless of what dimensions are in the view. FIXED: compute at specified dimensions (ignores view). INCLUDE: adds more granularity than the view. EXCLUDE: removes granularity from the view. Use case: "What % of customer's total does this sale represent?" — without LOD you can't compute customer total while showing individual orders. With LOD: {FIXED [Customer ID]: SUM([Sales])} gives customer total regardless of current view granularity.

**What are Tableau extracts and when should you use them?**
Extract: a compressed snapshot of data saved as a .hyper file. Lives locally (Tableau Desktop) or in the extract cache (Tableau Server). Benefits: much faster query performance than live connections (especially for large datasets), can work offline, can filter/aggregate at extract time to reduce size. Limitations: not real-time, must refresh on a schedule. Use extracts for: large datasets, databases with limited concurrency, complex calculations, dashboards needing speed. Use live connections for: real-time data requirements, small datasets, databases optimized for direct query (Snowflake, BigQuery).

**How do you optimize a slow Tableau dashboard?**
Data source: switch to extract, aggregate at source, filter unnecessary data at extract time. View: reduce marks (< 50K), use aggregations instead of row-level detail, avoid ATTR() on large sets. Calculations: use FIXED LOD instead of table calcs (computed at DB level), avoid nested table calcs, use INT() instead of FLOAT() where possible. Layout: reduce number of worksheets per dashboard, use device-specific layouts, lazy-load secondary views. Check: Help → Settings and Performance → Start Performance Recording to identify bottlenecks.
