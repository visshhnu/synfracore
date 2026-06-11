# Tableau — Data Visualisation and Business Intelligence

Tableau is the leading enterprise BI tool. It transforms raw data into interactive dashboards that non-technical users can explore. Learning Tableau opens data analyst, BI developer, and data scientist roles.

## Tableau Products

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
