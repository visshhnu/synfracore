# Tableau Interview Questions

## Core Concepts

**Q: What is Tableau? How does it differ from Power BI?**

Tableau is a data visualisation platform known for its drag-and-drop interface and powerful visualisation engine. It allows analysts to create interactive dashboards without coding.

| | Tableau | Power BI |
|---|---|---|
| Vendor | Salesforce | Microsoft |
| Pricing | Higher (per user) | Lower (Microsoft ecosystem) |
| Viz engine | Industry-leading, highly customisable | Strong, many pre-built visuals |
| Data connection | Excellent (200+ native connectors) | Good (strong Microsoft ecosystem) |
| Calculated fields | Tableau Calculations | DAX (more powerful for time intelligence) |
| Best for | Analyst-heavy teams, complex viz | Microsoft shops, self-service BI |

---

**Q: Key Tableau concepts — dimensions, measures, views.**

**Dimensions**: Qualitative fields (Category, Region, Customer Name). Shown in blue. Used for slicing data.

**Measures**: Quantitative fields (Sales, Profit, Quantity). Shown in green. Aggregated (SUM, AVG, etc.).

**VizQL**: Tableau's visual query language — dragging fields to shelves generates SQL automatically.

```
Drag to:
  Rows shelf → Y-axis or table rows
  Columns shelf → X-axis or table columns
  Color → colour encode
  Size → size encode
  Label → show value labels
  Filter → filter data

Mark types: Bar, Line, Circle, Square, Text, Map, Pie
Show Me: automatically suggests best chart type
```

---

**Q: Tableau calculations.**

```tableau
-- Calculated field (row-level, like a column)
Profit Margin = [Profit] / [Sales]
Age Group = IF [Age] >= 30 THEN "Senior" ELSE "Junior" END
Full Name = [First Name] + " " + [Last Name]

-- LOD (Level of Detail) Expressions — most advanced
-- FIXED: compute at specific dimension regardless of view
{ FIXED [Customer ID] : SUM([Sales]) }  -- Customer total, not affected by view filters

-- INCLUDE: add dimension to aggregation
{ INCLUDE [Order ID] : COUNT([Product]) }  -- Products per order

-- EXCLUDE: remove dimension from aggregation
{ EXCLUDE [Region] : AVG([Sales]) }  -- National average regardless of region filter

-- Table calculations (computed across rows in viz)
RUNNING_SUM(SUM([Sales]))     -- Running total
WINDOW_AVG(SUM([Sales]))      -- Average across partition
RANK(SUM([Sales]))            -- Rank within partition
```

---

**Q: Tableau Server vs Tableau Online (Tableau Cloud).**

**Tableau Server**: On-premise or cloud VM. Full control. IT managed.
**Tableau Cloud** (formerly Online): SaaS. Managed by Salesforce. Less setup.

Both: Publish workbooks, schedule data refreshes, manage permissions, web editing.

For data governance: Tableau Catalog (find, trust, and certify data sources).

---

**Q: Performance optimisation in Tableau.**

```
1. Use extracts (Tableau Data Extracts .tde/.hyper) instead of live connection
   → Queries run against local columnar store (much faster)
   → Schedule refreshes overnight

2. Reduce data: filter at source, aggregate before connecting

3. Avoid high-cardinality dimensions on Color/Shape/Label
   → Too many members = slow render

4. Use context filters: set filter as "context" to run before other filters

5. Limit marks: fewer marks = faster render (< 5000 marks recommended for charts)

6. Materialise LOD expressions: pre-compute and store as custom SQL or extract

7. Indexing in database: Tableau generates queries — ensure DB indexes match
```

## Revision Notes
```
TABLEAU: Visual analytics platform. Drag-and-drop. VizQL generates SQL.
Dimensions (blue) = qualitative/slice | Measures (green) = quantitative/aggregate

SHELVES: Rows + Columns = axes | Color/Size/Label = encodings | Filter = filter

CALCULATIONS:
Regular: row-level formulas | Table calcs: across viz rows (RUNNING_SUM, RANK)
LOD (Level of Detail):
  FIXED: specific dimension regardless of filters
  INCLUDE: add dimension to aggregate
  EXCLUDE: remove dimension from aggregate

TABLEAU SERVER vs CLOUD: Server=on-prem control | Cloud=SaaS managed

PERFORMANCE:
Use extracts (not live) | Reduce marks (<5000) | Context filters
Avoid high-cardinality on Color | Pre-aggregate data at source
```
