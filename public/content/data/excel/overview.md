# Excel & Advanced Excel — Complete Guide

**Before you start:** no prior data-analysis experience is required — basic spreadsheet familiarity (typing into cells, saving a file) is assumed.

Excel is the most widely used data tool in the world. From entry-level analysts to CFOs, everyone uses Excel. Mastering it means faster work, fewer errors, and better insights.

## Why This Exists (The Hook)

A messy 15,000-row export from a point-of-sale system tells you nothing by itself — leadership doesn't want the raw rows, they want one sentence: "Region X's revenue is flat because average selling price is quietly dropping." Excel exists to close that gap fast, without writing code or waiting on a data team: a formula language flexible enough to model almost anything, and a pivot table that turns thousands of rows into a two-minute answer.

**Analogy** — Think of Excel like a Swiss Army knife, not a single-purpose tool. A dedicated BI platform (Power BI, Tableau) is like a specialized kitchen appliance — excellent at one job, but requiring setup and a defined pipeline before it's useful. Excel is the knife already in your pocket: it can model a budget, reconcile a bank statement, or sketch a dashboard, all without installing anything or asking IT for a data connection first — which is exactly why every dedicated BI tool still gets "sanity-checked in Excel" before anyone trusts it.

**Try it (2 minutes)** — Reason through why `=VLOOKUP(A2, ProductTable, 3, FALSE)` almost always needs that final `FALSE` argument, without looking anything up: `FALSE` means "exact match only." If you omit it (or use `TRUE`), VLOOKUP will happily return the closest match below your lookup value instead of failing when there's no exact match — silently. For a product ID lookup, what real-world mistake would that silently produce, and why would it be worse than the formula just returning an error?

## Why Excel — And Why It Still Matters in 2026

Every data tool eventually has to answer to a spreadsheet. Power BI dashboards get sanity-checked in Excel. Finance teams build entire budgets in it. Startups run their first CRM in a shared sheet before they can afford real software. Excel wins because of three things no other tool matches as well: **zero setup cost** (it's already on every business laptop), **a formula language everyone half-knows already**, and **total flexibility** — you can model literally anything in a grid before deciding it deserves a proper database or app.

## Where Excel Is Actually Used (By Role)

| Role | What they do in Excel |
|---|---|
| Financial Analyst | Build 3-statement models, DCF valuations, variance analysis vs budget |
| Operations Manager | Track inventory, shift schedules, SLA compliance dashboards |
| HR / People Ops | Headcount planning, compensation bands, attrition tracking |
| Marketing Analyst | Campaign ROI, cohort retention tables, budget pacing |
| Supply Chain Analyst | Demand forecasting, reorder point calculations, vendor scorecards |
| Small Business Owner | Full bookkeeping, invoicing, cash flow forecasting |

If you can't yet picture *who* uses a formula and *why*, the formula is just trivia. The functions below are grouped by what they're actually for — not just syntax.

## Case Study 1 — Building a Regional Sales Dashboard

**Scenario**: You're a data analyst at a retail chain. Leadership wants to see which regions are underperforming *before* the quarterly review, not during it.

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "1. Raw Data", "sublabel": "15,000-row POS export", "color": "slate" },
    { "label": "2. Clean It", "sublabel": "Remove duplicates, fix regions, fix dates", "color": "blue" },
    { "label": "3. Summarise It", "sublabel": "Pivot Table: Region x Month x Revenue", "color": "purple" },
    { "label": "4. Visualise It", "sublabel": "Pivot Chart + Region slicer", "color": "amber" },
    { "label": "5. The Insight", "sublabel": "One sentence leadership actually needed", "color": "green" }
  ]
}
```

1. **Raw data**: A 15,000-row export of `Date, Region, Product Category, Revenue, Units Sold` from the POS system.
2. **Clean it**: Remove duplicate transaction IDs (`Data → Remove Duplicates`), fix inconsistent region names with `Find & Replace`, convert the `Date` text column to real dates with `Text to Columns`.
3. **Summarise it**: Build a Pivot Table — Rows: Region, Columns: Month, Values: Sum of Revenue. Add a calculated field for `Revenue / Units Sold` = Average Selling Price.
4. **Visualise it**: A Pivot Chart (combo: bars for revenue, line for units sold) connected to a Region slicer.
5. **The insight**: One region shows flat revenue but rising units sold — meaning average selling price is quietly dropping. That's the sentence leadership actually needed, and Excel got you there in an afternoon.

## Case Study 2 — Reconciling Two Messy Data Sources

**Scenario**: Finance gives you a list of "expected payments" and the bank gives you "actual payments received." You need to flag what's missing.

```excel
// Use XLOOKUP to check if each expected payment actually arrived
=XLOOKUP(A2, BankData[Reference], BankData[Amount], "MISSING")

// Then flag mismatches where amounts differ
=IF(B2<>C2, "AMOUNT MISMATCH", "OK")
```

This two-formula pattern — lookup, then compare — is one of the single most common real-world Excel tasks in finance and operations, far more common than any exotic array formula.

## Sample Practice Datasets & Scenarios

Practice with realistic, messy scenarios rather than clean textbook data — that's where the actual skill is:

- **E-commerce order data**: 3 months of orders with some duplicate rows, inconsistent date formats, and a few negative "refund" rows to handle — build a monthly revenue-by-category dashboard.
- **Employee attendance log**: Raw check-in/check-out timestamps — calculate hours worked per employee per week, flag anyone under 40 hours, using `NETWORKDAYS` and time arithmetic.
- **Survey responses**: 200 rows of Likert-scale (1–5) answers across 10 questions — use `COUNTIFS` to build a response-distribution summary and a stacked bar chart.
- **Loan/EMI schedule**: Given principal, rate, and tenure, build an amortisation table using `PMT`, `IPMT`, and `PPMT` — a genuinely common finance-analyst take-home test.

## Essential Functions

```excel
// Lookup Functions
=VLOOKUP(lookup_value, table_array, col_index, FALSE)
  Example: =VLOOKUP(A2, ProductTable, 3, FALSE)
  Finds value in first column, returns value from col 3
  FALSE = exact match (always use FALSE in practice!)

=XLOOKUP(lookup_value, lookup_array, return_array, [if_not_found])
  Modern replacement for VLOOKUP — no column number needed!
  =XLOOKUP(A2, ProductTable[ID], ProductTable[Price], "Not Found")
  Works left-to-right AND right-to-left unlike VLOOKUP

=INDEX(array, row_num, col_num)
=MATCH(lookup_value, lookup_array, 0)  // 0 = exact match
  Combined power:
  =INDEX(C2:C100, MATCH(A2, A2:A100, 0))
  More flexible than VLOOKUP, works any direction

=HLOOKUP(lookup_value, table_array, row_index, FALSE)
  Like VLOOKUP but searches across rows

// Conditional
=IF(condition, value_if_true, value_if_false)
  =IF(A2>100, "High", "Low")

=IFS(condition1, value1, condition2, value2, ...)  // Multiple conditions
  =IFS(A2>90, "A", A2>80, "B", A2>70, "C", TRUE, "D")

=IFERROR(formula, value_if_error)
  =IFERROR(VLOOKUP(A2, Table, 2, 0), "Not Found")

=SWITCH(expression, value1, result1, value2, result2, ..., default)
  =SWITCH(A2, "Mon", "Monday", "Tue", "Tuesday", "Unknown")

// Aggregation
=SUMIF(range, criteria, sum_range)
  =SUMIF(B2:B100, "Electronics", C2:C100)

=SUMIFS(sum_range, range1, criteria1, range2, criteria2, ...)
  =SUMIFS(C2:C100, B2:B100, "Electronics", D2:D100, "2024")

=COUNTIF(range, criteria)
  =COUNTIF(A2:A100, ">100")

=COUNTIFS(range1, criteria1, range2, criteria2)

=AVERAGEIF(range, criteria, average_range)
  =AVERAGEIF(B2:B100, "North", C2:C100)

// Text Functions
=LEFT(text, num_chars)         =LEFT("Hello World", 5) → Hello
=RIGHT(text, num_chars)        =RIGHT("Hello World", 5) → World
=MID(text, start, num_chars)   =MID("Hello World", 7, 5) → World
=LEN(text)                     =LEN("Hello") → 5
=TRIM(text)                    Remove extra spaces
=UPPER(text) / =LOWER(text) / =PROPER(text)
=CONCATENATE(text1, text2)     Or: =A1&" "&B1
=TEXTJOIN(",", TRUE, A2:A10)   Join with delimiter
=SPLIT(text, delimiter)        Google Sheets only -- Excel 365 has =TEXTSPLIT(text, delimiter),
                                a real formula-based equivalent that spills results across cells
                                automatically; older Excel has no formula equivalent, only the
                                manual, non-formula Text-to-Columns tool (Data → Text to Columns)

// Date Functions
=TODAY()                       Today's date
=NOW()                         Current date and time
=YEAR(date) / =MONTH(date) / =DAY(date)
=DATEDIF(start, end, "D")      Days between dates
=NETWORKDAYS(start, end)       Working days (excluding weekends)
=EDATE(date, months)           Date N months from date
=EOMONTH(date, 0)              Last day of month

// Math
=ROUND(number, digits)         =ROUND(3.14159, 2) → 3.14
=ROUNDUP / =ROUNDDOWN
=INT(number)                   Round down to integer
=MOD(number, divisor)          Remainder: =MOD(10, 3) → 1
=RAND()                        Random 0-1
=RANDBETWEEN(1, 100)           Random integer in range
```

## Pivot Tables — The Most Powerful Excel Feature

```
Creating a Pivot Table:
1. Click anywhere in your data
2. Insert → PivotTable
3. Choose location (new sheet recommended)
4. Drag fields to:
   - Rows: what you want to group by
   - Columns: secondary grouping (optional)
   - Values: what you want to calculate
   - Filters: filter the whole table

Common Pivot Configurations:

Sales by Region and Product:
  Rows: Region
  Columns: Product Category
  Values: Sum of Revenue

Monthly Trend:
  Rows: Date (group by Month)
  Values: Sum of Sales, Count of Orders

Customer Analysis:
  Rows: Customer Name
  Values: Sum of Revenue, Count of Orders, Average Order Value

Calculated Fields (PivotTable Analyze tab → Calculations group →
Fields, Items & Sets → Calculated Field -- NOT available by right-clicking
inside the pivot itself; the right-click menu only has Summarize/Show
Values As/Group/Refresh):
  = Revenue / Quantity   → creates "Average Price" field
  = Profit / Revenue     → creates "Profit Margin %" field

Refresh: Right-click → Refresh (when data changes)
Slicer: PivotTable Analyze → Insert Slicer (visual filter buttons)
Timeline: PivotTable Analyze → Insert Timeline (date filter)
```

Dynamic arrays (`FILTER`/`SORT`/`UNIQUE`), 2D lookups, and Power Query are genuinely intermediate/advanced material — covered in depth on the Intermediate tab once the lookup/conditional/aggregation functions above are comfortable, rather than repeated here.

## Excel Dashboard Essentials

```conceptgrid
{
  "boxes": [
    { "title": "Bar/Column", "description": "Compare categories -- e.g. sales by region", "color": "blue" },
    { "title": "Line", "description": "Trends over time -- e.g. monthly revenue", "color": "purple" },
    { "title": "Combo (Bar + Line)", "description": "Two related measures together -- e.g. revenue + growth %", "color": "amber" },
    { "title": "Waterfall", "description": "Cumulative effect -- e.g. a P&L breakdown", "color": "green" }
  ]
}
```

```
Chart Types and When to Use:
Bar/Column:   Compare categories (sales by region)
Line:         Trends over time (monthly revenue)
Pie/Donut:    Part of whole (market share) — max 5 slices
Scatter:      Correlation between two variables
Combo:        Bar + Line together (revenue + growth %)
Waterfall:    Show cumulative effect (P&L breakdown)
Sparklines:   Tiny charts in cells (trend at a glance)

Dashboard Design Rules:
1. Put KPIs at top (most important first)
2. Use consistent colors (1 main + 2 accent colors)
3. Remove chart borders and gridlines
4. Use white space — less is more
5. Every chart must have a clear title
6. Add data labels where needed

Dynamic Dashboard with Slicers:
1. Create Pivot Charts from your data
2. Insert → Slicer (choose filter field)
3. Right-click slicer → Report Connections → connect to all charts
4. Now one click filters everything!
```

## Data Cleaning Techniques

```excel
// Remove duplicates: Data → Remove Duplicates

// Flash Fill (Ctrl+E): Excel guesses pattern from examples
  Column A: "John Smith"
  Type "Smith" in B1, press Ctrl+E → auto-fills last names!

// Text to Columns: Data → Text to Columns
  Splits "New Delhi, India" into separate columns by comma

// TRIM + CLEAN:
  =TRIM(CLEAN(A2))  Remove spaces and non-printable characters

// Find and Replace (Ctrl+H) -- this is plain substring replacement, NOT
// regex: "*" and "$" are not wildcards/anchors here the way they are in a
// regex engine. To actually strip a currency symbol, replace the literal
// symbol itself, e.g. replace "$" with "" (matches the literal character):
  Replace "$" with "" to remove a leading currency symbol
  Replace "," with "" to remove thousands separators

// Convert text numbers to real numbers:
  Select cells → Data → Text to Columns → Finish
  Or: =VALUE(A2) or multiply by 1: =A2*1

// Conditional Formatting for data validation:
  Highlight duplicates: Home → Conditional Formatting → Highlight Rules → Duplicate Values
  Data bars: Home → Conditional Formatting → Data Bars
  Color scale: Conditional Formatting → Color Scales
```

## Keyboard Shortcuts (Game Changers)

```
Ctrl+T          Create table (auto-expanding ranges!)
Ctrl+Shift+L    Toggle filters
Ctrl+1          Format cells dialog
F4              Repeat last action / Toggle absolute reference $
Ctrl+;          Insert today's date
Ctrl+Shift+;    Insert current time
Alt+=           AutoSum
Ctrl+D          Fill down
Ctrl+R          Fill right
Ctrl+Home       Go to A1
Ctrl+End        Go to last used cell
Ctrl+PageDown   Move to next sheet
F2              Edit cell (without mouse)
Ctrl+Shift+$    Currency format
Ctrl+Shift+%    Percentage format
Alt+F11         Open VBA editor
```

## Interview Questions

**What is the difference between VLOOKUP and INDEX-MATCH?**
VLOOKUP only looks right — the lookup column must be the leftmost column in your range. INDEX-MATCH can look in any direction, and the lookup and return columns can be anywhere. VLOOKUP breaks if you insert a column (the column number shifts). INDEX-MATCH is dynamic because it uses column references. Also, XLOOKUP (Excel 365) is now the modern replacement for both — it's simpler syntax and handles errors gracefully.

**What is a Pivot Table and when would you use it?**
A Pivot Table summarises large datasets with drag-and-drop grouping without writing any formulas. You use it when you need to: see sales by region by month, count transactions by category, find top/bottom performers, calculate averages or sums across different slices of data. What would take hours with SUMIFS and formulas takes seconds with Pivot Tables. The key skill is knowing what goes in Rows vs Columns vs Values.
