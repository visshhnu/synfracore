# Power BI Interview Questions

## Core Concepts

**Q: What is Power BI? Components of the Power BI ecosystem.**

Power BI is Microsoft's business intelligence and data visualisation platform. Three main components:

**Power BI Desktop**: Free Windows app for building reports. Connect data, transform with Power Query, model with DAX, create visualisations.

**Power BI Service** (app.powerbi.com): Cloud platform. Publish reports, create dashboards, share, schedule data refresh. Requires Pro/Premium licence for sharing.

**Power BI Mobile**: iOS/Android app to view reports on mobile.

Additional: Power BI Embedded (embed in apps), Power BI Report Server (on-premise).

---

**Q: DAX (Data Analysis Expressions) — core concepts.**

DAX is Power BI's formula language for calculated columns and measures.

```dax
-- Measures (calculated at query time, context-aware)
Total Sales = SUM(Orders[Amount])
Average Order Value = DIVIDE([Total Sales], COUNT(Orders[OrderID]))
YTD Sales = TOTALYTD([Total Sales], Dates[Date])
Sales LY = CALCULATE([Total Sales], SAMEPERIODLASTYEAR(Dates[Date]))
Growth % = DIVIDE([Total Sales] - [Sales LY], [Sales LY])

-- Calculated columns (computed row by row, stored in model)
Full Name = Customers[FirstName] & " " & Customers[LastName]
Profit Margin = (Orders[Revenue] - Orders[Cost]) / Orders[Revenue]
Age Group = IF(Customers[Age] >= 30, "Senior", "Junior")

-- CALCULATE: the most important DAX function
-- Changes filter context for a calculation
Sales USA = CALCULATE([Total Sales], Customers[Country] = "USA")
Sales Top Products = CALCULATE([Total Sales], 
    TOPN(10, Products, [Total Sales], DESC))
    
-- Time intelligence
Sales MTD = TOTALMTD([Total Sales], Dates[Date])
Sales QTD = TOTALQTD([Total Sales], Dates[Date])
Rolling 3M = CALCULATE([Total Sales], 
    DATESINPERIOD(Dates[Date], LASTDATE(Dates[Date]), -3, MONTH))
```

---

**Q: Power Query in Power BI.**

```
Home → Transform Data → Power Query Editor

Steps:
1. Get Data (CSV, Excel, SQL Server, SharePoint, Web, etc.)
2. Remove unnecessary columns
3. Filter rows (e.g., only 2024 data)
4. Rename columns (make them user-friendly)
5. Change data types (text → date, text → number)
6. Split columns (Full Name → First, Last)
7. Merge queries (JOIN tables)
8. Add custom column (calculated field)
9. Close & Apply

Each step is recorded → refresh reruns all steps automatically.
```

---

**Q: Data model — star schema in Power BI.**

```
Fact Tables: contain measures (numbers), foreign keys
  → Orders (OrderID, CustomerID, ProductID, DateID, Amount, Quantity)
  → Sales (SaleID, ...)

Dimension Tables: contain attributes, primary keys  
  → Customers (CustomerID, Name, Country, Segment)
  → Products (ProductID, Category, Brand, Price)
  → Dates (DateID, Date, Year, Quarter, Month, Week)

Relationships: Fact → Dimension (many-to-one)
  Orders[CustomerID] → Customers[CustomerID]
  
Always use star schema (not snowflake) in Power BI for performance.
```

---

**Q: Row-Level Security (RLS).**

RLS restricts which data users see based on their identity.

```dax
-- Create role: "Sales Manager"
-- Add DAX filter to Sales table:
[Manager Email] = USERPRINCIPALNAME()
-- Each manager sees only their team's sales

-- Or use a security table:
[Region] IN VALUES(SecurityTable[Region])
-- Where SecurityTable maps user email to allowed regions
```

Deploy to Power BI Service → manage role assignments → test as user.

## Revision Notes
```
POWER BI ECOSYSTEM:
Desktop (build) → Service (publish/share) → Mobile (view)
Pro licence: share with others | Premium: larger datasets, no per-user licence

DAX KEY FUNCTIONS:
SUM/COUNT/AVERAGE: basic aggregates
CALCULATE: change filter context (most important function)
DIVIDE: safe division (handles divide-by-zero)
Time intelligence: TOTALYTD, SAMEPERIODLASTYEAR, TOTALMTD

CALCULATED COLUMN vs MEASURE:
Columns: computed per row, stored, use for slicing/filtering
Measures: computed on demand, context-aware, use for aggregations

DATA MODEL: Star schema (fact tables + dimension tables)
Fact → Dimension: many-to-one relationships
Always include a date dimension table

POWER QUERY: import + transform + load pipeline
Each step recorded → refresh reruns automatically

RLS: filter data by user identity using USERPRINCIPALNAME()
```
