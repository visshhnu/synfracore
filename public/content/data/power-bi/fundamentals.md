# Power BI — Fundamentals

## What is Power BI

Power BI is Microsoft's business intelligence platform for creating interactive reports and dashboards. It connects to hundreds of data sources, transforms data with Power Query, creates relationships, and builds visualizations.

## Key Components

```
Power BI Desktop  →  Free desktop app for report creation
Power BI Service  →  Cloud platform for sharing and collaboration
Power BI Mobile   →  iOS/Android for consuming reports
Power BI Gateway  →  Connect cloud to on-premise data

Report structure:
  Dataset   = data source + transformations + relationships
  Report    = collection of visualizations on one or more pages
  Dashboard = pinned tiles from multiple reports (Service only)
```

## Connecting Data Sources

```
Direct query sources:
  Azure SQL, SQL Server, PostgreSQL, MySQL
  Salesforce, SharePoint, Google Analytics
  REST APIs, web scraping

File sources:
  Excel (.xlsx), CSV, JSON, XML
  PDF (extract tables)
  Power BI Desktop files (.pbix)
  Azure Blob Storage / Data Lake

Import vs DirectQuery:
  Import:       Data loaded into Power BI (fast, full features)
  DirectQuery:  Queries run live against source (always current, slower)
  
  Use Import when: data fits in memory, performance matters
  Use DirectQuery when: data is huge or must be real-time
```

## Power Query Basics (M language)

```powerquery
// Load and transform in Power Query Editor
let
    // Step 1: Connect to source
    Source = Excel.Workbook(File.Contents("C:\sales.xlsx"), null, true),
    Sheet1 = Source{[Item="Sheet1",Kind="Sheet"]}[Data],
    
    // Step 2: Promote headers
    PromotedHeaders = Table.PromoteHeaders(Sheet1),
    
    // Step 3: Clean data
    RemovedBlanks = Table.SelectRows(PromotedHeaders, 
        each [CustomerName] <> null and [CustomerName] <> ""),
    
    // Step 4: Add calculated column
    AddedRevenue = Table.AddColumn(RemovedBlanks, "Revenue",
        each [Quantity] * [UnitPrice], type number),
    
    // Step 5: Filter
    FilteredDates = Table.SelectRows(AddedRevenue,
        each [OrderDate] >= #date(2024, 1, 1))
in
    FilteredDates
```
