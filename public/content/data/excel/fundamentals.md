# Excel & Advanced Excel — Fundamentals

## Essential Formulas

```excel
-- Lookup functions
=VLOOKUP(A2, $D$2:$F$100, 2, FALSE)      -- Find value in first col, return 2nd
=INDEX(C2:C100, MATCH(A2, A2:A100, 0))   -- More flexible than VLOOKUP
=XLOOKUP(A2, D2:D100, E2:E100, "Not found")  -- Modern (Excel 365/2019+)

-- Conditional
=IF(A2>100, "High", IF(A2>50, "Medium", "Low"))
=IFS(A2>100,"High", A2>50,"Medium", A2>0,"Low", TRUE,"Zero")
=SWITCH(B2, "Jan",1, "Feb",2, "Mar",3, 0)

-- Text functions
=TRIM(A2)                      -- Remove extra spaces
=CLEAN(A2)                     -- Remove non-printable characters
=PROPER(A2)                    -- Capitalize First Letter Each Word
=LEFT(A2, 5)                   -- First 5 characters
=MID(A2, 3, 4)                 -- 4 chars starting at position 3
=TEXT(A2, "dd/mm/yyyy")        -- Format date as text
=TEXTJOIN(", ", TRUE, A2:A10)  -- Join range with delimiter

-- Date/time
=TODAY()                       -- Current date
=NOW()                         -- Current date and time
=DATEDIF(A2, TODAY(), "D")     -- Days between dates
=EOMONTH(A2, 0)                -- Last day of month
=WORKDAY(A2, 5)                -- 5 working days from date

-- Math/Stats
=SUMIF(B2:B100, "North", C2:C100)   -- Sum where region = North
=COUNTIF(A2:A100, ">100")           -- Count values > 100
=AVERAGEIFS(C:C, A:A, "North", B:B, ">100")  -- Multi-condition average
=LARGE(A2:A100, 3)                   -- 3rd largest value
=PERCENTILE(A2:A100, 0.95)           -- 95th percentile
=SUMPRODUCT((A2:A100="North")*(B2:B100>100)*C2:C100)  -- Powerful multi-condition sum
```

## Power Query (Get & Transform)

```
Power Query = ETL inside Excel — import, clean, transform data

Key transformations:
  Remove Columns:     Delete unnecessary columns
  Filter Rows:        Keep only rows matching condition
  Replace Values:     Fix inconsistent data entry
  Split Column:       Split "FirstName LastName" into two columns
  Merge Queries:      SQL-like JOIN between tables
  Unpivot:           Turn wide table (months as columns) to long (one row per month)
  Group By:           Aggregate data
  Add Custom Column:  [Revenue] - [Cost]  (no = sign needed)

Benefits:
  - Steps recorded — refresh updates all transformations automatically
  - Connect to SQL, web, SharePoint, CSV, JSON
  - Handles millions of rows (unlike Excel grid limit of ~1M)
```

## Pivot Tables

```
Create: Insert → PivotTable → Select range

Layout:
  Rows:    Category to group by (Region, Product, Month)
  Columns: Second grouping (Quarter, Category)
  Values:  What to aggregate (Sum of Revenue, Count of Orders)
  Filters: Top-level filter (Year, Status)

Useful features:
  Value Field Settings: Change Sum to Average, Count, Max, %, Running Total
  Group By: Group dates by Month/Quarter/Year automatically
  Slicer: Visual filter buttons — great for dashboards
  Timeline: Filter by date range visually
  Calculated Field: Add custom formula (Profit = Revenue - Cost)
  Drill Down: Double-click a value to see underlying data

Refresh: Right-click → Refresh (or Ctrl+Alt+F5 for all)
```

## Data Validation

```
Data → Data Validation

Restrict input:
  Whole number between 1-100
  Date between today and +30 days
  List from range (dropdown)
  Text length < 50 characters
  Custom formula: =ISNUMBER(A1)

Dropdown from list:
  Source: =Sheet2!$A$2:$A$20  (dynamic range)
  Or type: North,South,East,West

Dependent dropdown:
  Region in A2, then cities in B2 based on region
  Use INDIRECT: =INDIRECT(A2)  
  (Requires named ranges for each region: North, South, etc.)
```

## Useful Keyboard Shortcuts

```
Ctrl+T          Convert to Table (enables auto-filter, structured refs)
Ctrl+Shift+L    Toggle filters
Alt+=           AutoSum
Ctrl+`          Toggle formula view
F4              Toggle absolute/relative reference ($A$1, $A1, A$1, A1)
Ctrl+D          Fill down
Ctrl+R          Fill right
Ctrl+Space      Select entire column
Shift+Space     Select entire row
Ctrl+Shift+End  Extend selection to last used cell
Ctrl+;          Insert today's date
Ctrl+:          Insert current time
Alt+Enter       New line within cell
Ctrl+1          Format Cells dialog
F2              Edit cell
```
