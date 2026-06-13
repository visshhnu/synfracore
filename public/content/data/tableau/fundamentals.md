# Tableau — Fundamentals

## What is Tableau

Tableau is a data visualization platform that lets you build interactive dashboards and reports by dragging and dropping data fields. It's widely used in business intelligence, analytics, and data science.

## Key Concepts

```
Data Source:   Connect to databases, files, cloud services
Fields:        Dimensions (qualitative/categorical) vs Measures (quantitative)
Marks:         Data points on a visualization (bars, points, shapes)
Shelves:       Rows, Columns, Filters, Color, Size, Label, Detail, Tooltip
Sheet:         One visualization
Dashboard:     Collection of sheets + interactive filters
Story:         Presentation of sheets/dashboards with narrative
```

## Getting Started

```
1. Connect to data:
   File: Excel, CSV, JSON, PDF
   Server: Tableau Server, Tableau Cloud
   Connectors: PostgreSQL, MySQL, Snowflake, BigQuery, Salesforce

2. Understand your fields:
   Blue = Dimension (categorical, discrete)
   Green = Measure (numeric, continuous)
   
   Tableau auto-classifies: Date as Dimension, Sales as Measure

3. Build a view:
   Drag Dimension to Columns → creates axis/category
   Drag Measure to Rows → creates bar/axis
   Drag to Color → color code the marks
   Drag to Size → size the marks

4. Show Me panel: Tableau suggests the right chart type based on fields selected
```

## Essential Chart Types

```
Bar chart:     Sales by Region → Region to Columns, Sales to Rows
Line chart:    Sales over time → Date to Columns, Sales to Rows
Scatter plot:  Sales vs Profit → Sales to Columns, Profit to Rows, Product to Color
Map:           Revenue by country → Auto-detected from geo fields
Treemap:       Part of whole → Sales to Color and Size, Category to Label
Heat map:      Category vs Time → Date to Columns, Category to Rows, Sales to Color
```
