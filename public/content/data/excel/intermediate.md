# Excel — Intermediate

## Advanced Formulas

```excel
-- XLOOKUP (Excel 365/2021+) — replaces VLOOKUP
=XLOOKUP(A2, Products[SKU], Products[Price], "Not Found", 0, 2)
-- Arguments: lookup_value, lookup_array, return_array, if_not_found, match_mode, search_mode
-- match_mode: 0=exact, -1=exact or next smaller, 1=exact or next larger, 2=wildcard
-- search_mode: 1=first to last, -1=last to first, 2=binary sort asc

-- FILTER (dynamic array)
=FILTER(A2:C100, (B2:B100="North")*(C2:C100>1000), "No data")
-- Returns all rows where region=North AND amount>1000

-- SORT and SORTBY
=SORT(A2:C100, 3, -1)          -- Sort by column 3 descending
=SORTBY(A2:C100, C2:C100, -1, B2:B100, 1)  -- Sort by C desc, then B asc

-- UNIQUE
=UNIQUE(B2:B100)                -- Distinct values from column B

-- Dynamic SUMIF with named table
=SUMIFS(Sales[Amount], Sales[Region], "North", Sales[Date], ">="&DATE(2024,1,1))

-- TEXTJOIN with condition
=TEXTJOIN(", ", TRUE, IF(B2:B100="Manager", A2:A100, ""))
-- Ctrl+Shift+Enter for array formula in older Excel

-- LET function (reuse calculations)
=LET(
    sales, SUM(C2:C100),
    target, 100000,
    pct, sales/target,
    IF(pct>=1, "✓ Target Met", "Need "&TEXT(target-sales,"#,##0")&" more")
)
```

## Power Query Advanced

```
Advanced transformations in Power Query:

Custom columns:
  = [Revenue] - [Cost]           -- Basic calculation
  = Number.Round([Price] * 1.18, 2)  -- With function
  = if [Status] = "Active" then 1 else 0  -- Conditional

Grouping and aggregation:
  Group By: Customer → Sum of Revenue, Count of Orders, Max of Amount
  All rows: Group By → Add All Rows column → expand to get grouped + detail

Pivot and Unpivot:
  Pivot: Turn monthly columns into aggregated rows
  Unpivot: Turn wide table (Jan/Feb/Mar columns) into tall (Month/Value)

Merge (JOIN):
  Left Outer: All rows from first table
  Inner: Only matching rows
  Full Outer: All rows from both

Custom functions:
  let
    fn = (InputDate as date) =>
    let
        Month = Date.MonthName(InputDate),
        Year = Date.Year(InputDate),
        Result = Year & " - " & Month
    in Result
  in fn

Use in column: = Table.AddColumn(tbl, "Period", each fn([OrderDate]))
```

## Dashboard Best Practices

```
Design principles:
  1. One key message per dashboard
  2. Most important metric → top left (eye tracks left to right)
  3. Consistent colors (green=good, red=bad, blue=neutral)
  4. Minimize gridlines and borders
  5. Use white space deliberately

Chart selection:
  Trend over time      → Line chart
  Part of whole        → Pie (< 5 slices) or 100% stacked bar
  Comparison           → Bar/column chart
  Distribution         → Histogram, box plot
  Correlation          → Scatter plot
  Single KPI           → Large number with sparkline

Slicers + Timelines:
  Connect to multiple PivotTables/Charts: Right-click slicer → Report Connections
  This lets one slicer filter all charts on the dashboard

Dynamic chart titles:
  = "Revenue for " & TEXT(A1, "MMMM YYYY") & ": " & TEXT(SUM_FORMULA, "$#,##0")
  Link cell to chart title by clicking title → type = → click the formula cell
```
