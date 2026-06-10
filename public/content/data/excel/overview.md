# Excel & Advanced Excel — Complete Guide

Excel is the most widely used data tool in the world. From entry-level analysts to CFOs, everyone uses Excel. Mastering it means faster work, fewer errors, and better insights.

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
=SPLIT(text, delimiter)        Google Sheets — Excel uses Text-to-Columns

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

Calculated Fields (right-click in pivot → Add Calculated Field):
  = Revenue / Quantity   → creates "Average Price" field
  = Profit / Revenue     → creates "Profit Margin %" field

Refresh: Right-click → Refresh (when data changes)
Slicer: PivotTable Analyze → Insert Slicer (visual filter buttons)
Timeline: PivotTable Analyze → Insert Timeline (date filter)
```

## Advanced Formulas

```excel
// Array Formulas (Ctrl+Shift+Enter in older Excel, just Enter in 365)
=UNIQUE(array)                 Remove duplicates
=SORT(array, sort_index)       Sort dynamically
=FILTER(array, include, [if_empty])
  =FILTER(A2:C100, B2:B100="Electronics", "No data")
  Returns only Electronics rows dynamically!

=SEQUENCE(rows, cols, start, step)
  =SEQUENCE(10) → 1,2,3...10
  =SEQUENCE(5, 1, 0, 2) → 0,2,4,6,8

// Dynamic array spill functions (Excel 365)
=SORT(UNIQUE(FILTER(A2:A100, B2:B100>100)))
  Filter rows where B > 100, get unique values, sort them

// XLOOKUP with multiple results
=XLOOKUP(E2, A2:A100, B2:D100)  // Returns entire row

// 2D Lookup
=INDEX(data_range, MATCH(row_value, row_headers, 0), MATCH(col_value, col_headers, 0))

// Running totals
=SUM($B$2:B2)   // Anchor start, relative end

// OFFSET for dynamic ranges
=SUM(OFFSET(A1, 0, 0, COUNTA(A:A), 1))
  // Sum only non-empty cells even as data grows

// Power Query (Get & Transform) — for data cleaning
// Data → Get Data → From Table/Range
// Steps are recorded and replayable!
// Merge queries = like SQL JOIN
// Append queries = stack tables vertically
```

## Excel Dashboard Essentials

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

// Find and Replace (Ctrl+H):
  Replace "*$" with "" to clean currency symbols
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
