# Tableau Fundamentals

## What is Tableau?

Tableau is a leading Business Intelligence (BI) and data visualization platform that enables users to connect to data sources, create interactive dashboards, and share insights — all without writing code. It is widely used by data analysts, business analysts, and data scientists.

## Core Products

```
TABLEAU DESKTOP:    full-featured authoring (paid)
TABLEAU SERVER:     on-premise deployment and sharing
TABLEAU CLOUD:      SaaS version of Server (formerly Tableau Online)
TABLEAU PUBLIC:     free, public publishing only
TABLEAU PREP:       data preparation and ETL
TABLEAU READER:     free viewer for packaged workbooks
```

## Key Concepts

```
DIMENSIONS vs MEASURES:
  Dimensions: categorical (discrete) — blue pills
    Customer Name, Category, Region, Order Date (discrete)
  Measures: numeric (continuous) — green pills
    Sales, Profit, Quantity, Discount

  Drag dimension to Rows/Columns = grouping
  Drag measure to chart area = aggregation (SUM, AVG, etc.)

MARK TYPES:
  Bar, Line, Area, Scatter, Map, Pie, Gantt, Text, Circle, Shape, Square

AGGREGATION:
  Default: SUM for measures
  Right-click measure → Measure → change to AVG, COUNT, MEDIAN, etc.
  Disaggregate: Analysis menu → uncheck Aggregate Measures

FILTERS ORDER (inner to outer):
  Extract filter → Data source filter → Context filter →
  Dimension filter → Measure filter → Table calc filter
  
  Context filter: creates a temporary table → all other filters apply to it
  Useful for: Top N within a filtered set

CALCULATED FIELDS:
  Create new measures or dimensions from existing data
  [Profit Ratio] = SUM([Profit]) / SUM([Sales])
  [High Value] = IIF([Sales] > 10000, "High", "Low")
  Date calc: DATEDIFF('day', [Order Date], [Ship Date])
```

## Common Chart Types

```
BAR CHART: Compare categories
  Dimensions on Rows, Measure on Columns (or vice versa)
  Sort: right-click axis → Sort

LINE CHART: Show trends over time
  Date on Columns, Measure on Rows
  Right-click date → exact date vs. year/quarter/month/day

SCATTER PLOT: Correlation between two measures
  Measure on Columns, Measure on Rows
  Add dimension to Detail = one point per member

MAP: Geographic data
  Latitude/Longitude or geographic dimension (Country, State, City)
  Drag geographic field → Tableau assigns coordinates automatically

HEATMAP: Two dimensions + color measure
  Dimension on Rows, Dimension on Columns
  Measure to Color → change mark type to Square

TREEMAP: Hierarchical proportions
  Drag measure to Size, dimension to Label
  Change mark type to Square

DASHBOARD:
  File → New Dashboard → drag sheets from left panel
  Set dashboard size (device-specific layouts available)
  Add actions: filter action, highlight action, URL action
```

## Study Resources
- **Tableau Public Gallery** (public.tableau.com) — see what others build, download workbooks
- **Tableau Training** (tableau.com/learn/training) — free videos from Tableau
- **Tableau Desktop Specialist** — entry-level certification ($250)
- **Andy Kriebel Viz Makeovers** (YouTube) — improve chart design skills
- **Storytelling with Data** (Cole Nussbaumer Knaflic) — book on effective dataviz
