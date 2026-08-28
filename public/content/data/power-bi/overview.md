# Power BI — Business Intelligence & Data Visualization

**Before you start:** comfort with Excel formulas and pivot tables is assumed — Power BI's DAX language and data model build directly on those concepts, at larger scale and with live refresh.

Power BI is Microsoft's business analytics platform. It connects to hundreds of data sources, transforms data, creates interactive dashboards, and shares insights across organizations.

## Why This Exists (The Hook)

An Excel workbook mailed around as an attachment is already stale the moment it's sent, connects to exactly one data source, and breaks the moment two people edit different copies. Power BI exists to fix all three problems at once: dashboards refresh on a schedule instead of being manually rebuilt, connect to dozens of live data sources instead of one static export, and get published once to a service everyone views the same live version of — rather than passing files back and forth.

**Analogy** — Think of a Power BI dataset like a single shared Google Doc, versus Excel workbooks like emailed Word attachments. Emailed attachments fork the moment two people edit their own copy — nobody's sure which version is current. A Power BI dataset published to the Service is the one shared source everyone views live, refreshed on a schedule, with row-level security controlling who sees what — the same underlying reliability improvement that made shared docs replace emailed files.

**Try it (2 minutes)** — Reason through why a measure (`Total Revenue = SUM(Orders[Revenue])`) recalculates differently depending on what's selected in a report, while a calculated column doesn't, without looking anything up: a calculated column is computed once, row by row, when data loads — it's a fixed value stored in the model. A measure is computed on-the-fly using whatever filters are currently active (the country/year/product selected in the report). If you click a different region in a slicer, why would a measure's displayed value change instantly, while a calculated column's stored values never do?

## Power BI Components

```
Power BI Desktop    → Free authoring tool (Windows only)
Power BI Service    → Cloud platform (app.powerbi.com)
Power BI Mobile     → iOS/Android apps
Power BI Gateway    → Connects cloud to on-premises data
Power BI Embedded   → Embed reports in your own apps
```

**Workflow:**

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Data Sources", "sublabel": "SQL, Excel, APIs, cloud warehouses", "color": "blue" },
    { "label": "Power Query", "sublabel": "Transform -- ETL step (M language)", "color": "purple" },
    { "label": "Data Model", "sublabel": "Star schema, relationships, DAX measures", "color": "amber" },
    { "label": "Visuals", "sublabel": "Charts, tables, slicers on a report page", "color": "green" },
    { "label": "Publish & Share", "sublabel": "Power BI Service -- scheduled refresh", "color": "slate" }
  ]
}
```

## Connecting to Data Sources

```
Direct connect to:
- SQL Server, MySQL, PostgreSQL, Oracle
- Excel, CSV, JSON, XML files
- Azure SQL, Azure Synapse, Snowflake
- SharePoint, OneDrive
- REST APIs (Web connector)
- Google Analytics, Salesforce
- Python/R scripts

Import vs DirectQuery vs Live Connection:
Import       → Data copied into Power BI (fast queries, 1GB limit, scheduled refresh)
DirectQuery  → Queries source database every time (always current, source must be fast)
Live         → Like DirectQuery but for Analysis Services (no transformation)
```

```conceptgrid
{
  "boxes": [
    { "title": "Import", "description": "Data copied into Power BI -- fast queries, 1GB limit, scheduled refresh", "color": "blue" },
    { "title": "DirectQuery", "description": "Queries source database every time -- always current, source must be fast", "color": "amber" },
    { "title": "Live Connection", "description": "Like DirectQuery but for Analysis Services -- no transformation step", "color": "purple" }
  ]
}
```

## Power Query (M Language) — Data Transformation

Power Query is the ETL engine in Power BI. The GUI generates M code automatically.

```m
// M Language examples

// Load and filter a SQL table
let
    Source = Sql.Database("myserver.database.windows.net", "mydatabase"),
    OrdersTable = Source{[Schema="dbo", Item="Orders"]}[Data],
    
    // Filter rows
    FilteredRows = Table.SelectRows(OrdersTable, each [Status] = "Completed"),
    
    // Select columns
    SelectedColumns = Table.SelectColumns(FilteredRows, 
        {"OrderId", "CustomerName", "Amount", "OrderDate"}),
    
    // Add calculated column
    AddedRevenueTier = Table.AddColumn(SelectedColumns, "RevenueTier", 
        each if [Amount] > 1000 then "Premium"
             else if [Amount] > 500 then "Standard"
             else "Basic", type text),
    
    // Parse dates
    ChangedType = Table.TransformColumnTypes(AddedRevenueTier, 
        {{"OrderDate", type date}, {"Amount", type number}})
in
    ChangedType
```

## DAX — Data Analysis Expressions

DAX is the formula language for creating measures and calculated columns.

```dax
-- Basic measures
Total Revenue = SUM(Orders[Revenue])
Total Orders = COUNTROWS(Orders)
Average Order Value = AVERAGE(Orders[Revenue])
Max Order = MAX(Orders[Revenue])

-- Percentage
Revenue % of Total = 
DIVIDE(
    SUM(Orders[Revenue]),
    CALCULATE(SUM(Orders[Revenue]), ALL(Orders)),
    0
)

-- Year-over-Year Growth
YoY Growth % = 
VAR CurrentYear = SUM(Orders[Revenue])
VAR PreviousYear = CALCULATE(
    SUM(Orders[Revenue]),
    SAMEPERIODLASTYEAR(Calendar[Date])
)
RETURN
DIVIDE(CurrentYear - PreviousYear, PreviousYear, 0)

-- Running total (YTD)
Revenue YTD = 
CALCULATE(
    SUM(Orders[Revenue]),
    DATESYTD(Calendar[Date])
)

-- Moving average (last 3 months)
Revenue 3M Avg = 
CALCULATE(
    AVERAGE(MonthlyRevenue[Revenue]),
    DATESINPERIOD(Calendar[Date], LASTDATE(Calendar[Date]), -3, MONTH)
)

-- Customer segmentation with SWITCH
Customer Tier = 
SWITCH(
    TRUE(),
    [Total Customer Revenue] >= 100000, "Platinum",
    [Total Customer Revenue] >= 50000, "Gold",
    [Total Customer Revenue] >= 10000, "Silver",
    "Bronze"
)

-- FILTER + CALCULATE combo
Premium Revenue = 
CALCULATE(
    SUM(Orders[Revenue]),
    FILTER(Orders, Orders[Category] = "Premium")
)

-- Rank
Revenue Rank = 
RANKX(
    ALL(Products[ProductName]),
    [Total Revenue],
    ,
    DESC,
    Dense
)

-- Previous month comparison
Previous Month Revenue = 
CALCULATE(
    SUM(Orders[Revenue]),
    PREVIOUSMONTH(Calendar[Date])
)

-- Context-aware RELATED (lookup from related table)
Product Category = RELATED(Products[Category])
```

## Data Modeling Best Practices

```
Star Schema (recommended):

         Fact Table
    Orders (millions of rows)
    - OrderId (PK)
    - CustomerId (FK)
    - ProductId (FK)
    - DateId (FK)
    - Revenue
    - Quantity

    ↕               ↕              ↕
Customers      Products         Calendar
(dimension)    (dimension)    (dimension)
- CustomerId   - ProductId    - DateId
- Name         - Name         - Date
- Region       - Category     - Month
- Segment      - Price        - Quarter
                               - Year

Rules:
✓ One fact table per subject (sales, inventory, HR)
✓ Dimension tables are small (100s-10,000s of rows)
✓ Always use a Calendar/Date table (not auto-date)
✓ Relationships: one-to-many from dimension to fact
✗ Avoid many-to-many relationships (use bridge table)
✗ Don't store calculated values in fact table (use measures)
```

## Calendar Table (Essential)

```dax
-- Always create a Calendar table
Calendar = 
ADDCOLUMNS(
    CALENDAR(DATE(2020,1,1), DATE(2030,12,31)),
    "Year", YEAR([Date]),
    "Month", MONTH([Date]),
    "MonthName", FORMAT([Date], "MMMM"),
    "MonthShort", FORMAT([Date], "MMM"),
    "Quarter", "Q" & QUARTER([Date]),
    "WeekNumber", WEEKNUM([Date]),
    "DayOfWeek", WEEKDAY([Date], 2),
    "DayName", FORMAT([Date], "dddd"),
    "IsWeekend", IF(WEEKDAY([Date], 2) >= 6, TRUE, FALSE),
    "YearMonth", FORMAT([Date], "YYYY-MM"),
    "IsCurrentMonth", IF(EOMONTH([Date], 0) = EOMONTH(TODAY(), 0), TRUE, FALSE)
)
```

## Row-Level Security (RLS)

```dax
-- Create role: SalesRep (each rep sees only their region)
-- In Model → Manage Roles → Create role "SalesRep"
-- Table: Orders, DAX filter:
[SalesRepEmail] = USERPRINCIPALNAME()

-- Regional manager sees their region
[Region] IN VALUES(RegionAccess[Region])
-- (RegionAccess table maps manager email to regions)

-- Test RLS
-- View as: SalesRep → john.doe@company.com
```

## Performance Optimization

```
Common performance issues and fixes:

1. Too many visuals on one page
   Fix: Reduce to 5-8 key visuals, use drill-through for detail

2. Slow measures
   Fix: Use variables (VAR) to avoid recalculating,
        avoid nested CALCULATE, use SUMX sparingly

3. High cardinality columns
   Fix: Don't put customer IDs or email in slicers,
        use categories instead of raw values

4. Large import model
   Fix: Remove unused columns in Power Query,
        aggregate data before import,
        use integer keys instead of text for relationships

5. DirectQuery slow
   Fix: Add query folding, use indexed columns,
        consider import for frequently queried data
```

## Publishing and Sharing

```
Power BI Service workflow:

1. Publish from Desktop → Power BI Service
2. Create App from workspace
3. Set up scheduled refresh (Gateway for on-prem)
4. Share dashboard or publish App
5. Embed in Teams, SharePoint, or website

Licensing:
Free → Publish to My Workspace, no sharing
Pro  → Share with others, collaborate ($10/user/month)  
Premium → Large deployments, paginated reports, AI features
```

## Interview Questions

**What is the difference between a measure and a calculated column?**
A calculated column is computed row-by-row when data is loaded and stored in the model — it takes up memory. Use for: values needed in slicers/filters, row-level calculations, lookup values. A measure is computed on-the-fly at query time based on the current filter context — it doesn't take up storage. Use for: aggregations (SUM, COUNT, AVERAGE), KPIs, percentage calculations. Rule of thumb: if you need to aggregate it, use a measure. If you need to filter/slice by it, use a calculated column.

**Explain filter context and row context in DAX.**
Row context is what row you're currently on when calculating a calculated column — it's like being inside a loop through the table rows. Filter context is the set of filters applied to the model at any moment (from slicers, page filters, visual filters, and report filters). Measures execute in filter context, not row context. CALCULATE modifies the filter context. This is why `SUM(Sales[Amount])` in a measure gives different results depending on what country, year, or product is selected in the report — the filter context changes.
