# Tableau — Data Visualisation and Business Intelligence

**Before you start:** general spreadsheet/data familiarity (rows, columns, aggregation) is assumed. [Power BI](/academies/data/power-bi/overview) covers similar ground with Microsoft's tooling — Tableau is the same category of tool with a different vendor, philosophy, and query language.

Tableau is the leading enterprise BI tool. It transforms raw data into interactive dashboards that non-technical users can explore. Learning Tableau opens data analyst, BI developer, and data scientist roles.

## Why This Exists (The Hook)

A chart built to answer one question ("what were Q3 sales?") is often a dead end the moment someone asks a natural follow-up ("okay, but which region drove that?"). Tableau exists to make that follow-up free — click a bar in one chart, and every other chart on the dashboard filters to match, so exploring a dataset feels like a conversation instead of a series of separate requests to a data team.

**Analogy** — Think of a Tableau dashboard like a shop's interactive touchscreen directory, not a printed map. A printed map (a static chart or PDF report) shows you exactly one view, fixed at print time. An interactive directory lets you tap a store name and the map updates to highlight the route — the same data, but responsive to what you actually asked. Clicking a bar in a Tableau dashboard and watching every other chart filter to match is that same responsiveness, applied to data instead of store directions.

**Try it (2 minutes)** — Reason through why a `{ FIXED [Customer ID] : SUM([Sales]) }` LOD expression is needed instead of just `SUM([Sales])`, without looking anything up: a normal `SUM([Sales])` aggregates at whatever level the current view is showing — if the view is grouped by month, it sums per month. If you want "total sales per customer, regardless of what time period the view is currently showing," what would a view-level-dependent SUM give you instead, and why does "FIXED" (ignore the view, compute at this specific level) solve that?

## Tableau Products

```conceptgrid
{
  "boxes": [
    { "title": "Tableau Desktop", "description": "Build visualisations and dashboards (Windows/Mac)", "color": "blue" },
    { "title": "Tableau Server / Cloud", "description": "Share and publish within an organisation -- on-prem or SaaS", "color": "purple" },
    { "title": "Tableau Public", "description": "Free, all work is public", "color": "amber" },
    { "title": "Tableau Prep", "description": "Data cleaning and transformation pipeline", "color": "green" }
  ]
}
```

```
Tableau Desktop:    Build visualisations and dashboards (Windows/Mac)
Tableau Server:     Share and publish within organisation (on-premise)
Tableau Cloud:      SaaS version of Tableau Server
Tableau Public:     Free, all work is public
Tableau Prep:       Data cleaning and transformation pipeline
Tableau Reader:     View packaged workbooks (free, no editing)
```

## Core Concepts

```
Workbook (.twbx):   Everything — data, worksheets, dashboards
Worksheet:          Single visualisation
Dashboard:          Collection of worksheets + filters + text
Story:              Sequence of dashboards that tell a narrative

Data pane:
  Dimensions (blue): Categorical — names, dates, IDs, regions
  Measures (green):  Numeric — revenue, quantity, count
  
Marks:
  Color, Size, Label, Detail, Tooltip, Shape
  Dragging a field to marks encodes it visually
```

## Building Visualisations

```
Show Me panel: Automatically suggests chart type based on fields selected

Chart type selection guide:
  Bar chart:        Compare categories (Sales by Region)
  Line chart:       Trends over time (Monthly Revenue)
  Scatter plot:     Correlation between two measures
  Map:              Geographic data (Sales by State)
  Pie/Donut:        Part of whole (max 5 categories)
  Treemap:          Hierarchical proportions
  Heat map:         Two dimensions with colour intensity
  Gantt chart:      Project timelines
  Box plot:         Distribution and outliers
  
Dual axis:
  Drag second measure to right axis
  Right-click → Synchronise Axis
  Change mark type per axis (bar + line combo)
```

## Calculated Fields

```
// Basic calculation
[Sales] - [Cost]

// Conditional
IF [Sales] > 10000 THEN "High"
ELSEIF [Sales] > 5000 THEN "Medium"
ELSE "Low"
END

// Date calculations
DATEDIFF('day', [Order Date], [Ship Date])

// Running total
RUNNING_SUM(SUM([Sales]))

// Year over year growth
(SUM([Sales]) - LOOKUP(SUM([Sales]), -1)) / 
ABS(LOOKUP(SUM([Sales]), -1))

// Rank within partition
RANK(SUM([Sales]))
```

## LOD (Level of Detail) Expressions — The Power Feature

LOD expressions compute at a different granularity than the view.

```conceptgrid
{
  "boxes": [
    { "title": "FIXED", "description": "Ignore view filters entirely -- compute at a specified level (e.g. total per customer)", "color": "blue" },
    { "title": "INCLUDE", "description": "More granular than the view -- e.g. average order value when view is at customer level", "color": "purple" },
    { "title": "EXCLUDE", "description": "Less granular than the view -- e.g. annual total shown on a monthly view", "color": "amber" }
  ]
}
```

```
// FIXED — ignore view filters, compute at specified level
{ FIXED [Customer ID] : SUM([Sales]) }
// "Total sales per customer" regardless of what the view shows

// INCLUDE — more granular than view
{ INCLUDE [Order ID] : SUM([Sales]) }
// Average order value when view is at customer level

// EXCLUDE — less granular than view  
{ EXCLUDE [Month] : SUM([Sales]) }
// Annual total on a monthly view

// Common use: % of total
SUM([Sales]) / { FIXED : SUM([Sales]) }

// Cohort analysis: first purchase date per customer
{ FIXED [Customer ID] : MIN([Order Date]) }
```

## Dashboard Design Best Practices

```
Layout:
  Most important KPIs: Top left (eye tracking follows Z pattern)
  Filters: Top or right side, visible
  Context/title: Clear and concise
  
Interactivity:
  Use filters as actions (click bar → filter other charts)
  Highlight actions (hover → highlight related)
  URL actions (click → open external link)
  
Colour:
  One primary colour + one accent
  Diverging palette for positive/negative
  Sequential for quantities
  Accessible: Colour-blind safe palettes (avoid red-green alone)

Performance:
  Extract data sources (not live connection for dashboards)
  Aggregate data before Tableau (fewer rows = faster)
  Limit marks: Over 100K marks → performance degrades
  Context filters: Reduce data early in pipeline
```

## Connecting to Data

```
Live connection:  Every interaction queries the database (real-time but slow)
Extract (.hyper): Snapshot of data in Tableau format (fast, not real-time)
Publish extract:  Schedule refresh on Tableau Server/Cloud

Supported sources:
  Databases: PostgreSQL, MySQL, Snowflake, BigQuery, Redshift, SQL Server
  Files: Excel, CSV, JSON, Spatial files
  Cloud: Salesforce, Google Analytics, Marketo
  ODBC/JDBC: Any database with driver
```

## Interview Topics

**What is the difference between FIXED, INCLUDE, and EXCLUDE LOD expressions?**
FIXED computes at a specified level completely independent of the view — even ignoring dimension filters. INCLUDE adds specified dimensions to the level of detail, making the calculation more granular than the view. EXCLUDE removes specified dimensions from the calculation, making it less granular. The most common use is FIXED for cohort analysis and totals.

**When would you use an Extract vs Live connection?**
Extract when dashboard performance is the priority, data doesn't change frequently, or you need to work offline. Live connection when real-time data is essential (financial dashboards, operational monitoring) and you can tolerate the query latency. Large live connections can make dashboards unusable — always test performance with realistic data volumes.
