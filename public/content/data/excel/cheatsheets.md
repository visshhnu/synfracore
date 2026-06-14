# Excel — Cheatsheet

```excel
-- ── ESSENTIAL FORMULAS ────────────────────────────────────
=SUM(A1:A100)                     -- Sum range
=AVERAGE(A1:A100)                 -- Average
=COUNT(A1:A100)                   -- Count numbers
=COUNTA(A1:A100)                  -- Count non-empty
=MAX(A1:A100) / =MIN(A1:A100)    -- Max/Min

-- Lookup
=VLOOKUP(A2, Table!A:C, 3, FALSE)        -- Exact lookup, return col 3
=XLOOKUP(A2, Table!A:A, Table!C:C, "NA")  -- Better than VLOOKUP
=INDEX(Table!C:C, MATCH(A2, Table!A:A, 0)) -- Most flexible lookup

-- Conditional
=IF(A2>100, "High", IF(A2>50, "Med", "Low"))
=IFS(A2>100,"High", A2>50,"Med", TRUE,"Low")  -- Multiple conditions
=COUNTIF(A:A, ">100")                           -- Count if condition
=SUMIF(B:B, "East", C:C)                        -- Sum if region=East
=AVERAGEIFS(C:C, B:B, "East", D:D, "Q1")       -- Average with 2 conditions

-- Text
=TRIM(A2)                         -- Remove extra spaces
=UPPER(A2) / =LOWER(A2)          -- Change case
=LEFT(A2,5) / =RIGHT(A2,3)       -- Extract characters
=MID(A2,3,4)                      -- Extract from middle (start, length)
=LEN(A2)                          -- Character count
=SUBSTITUTE(A2,"old","new")       -- Replace text
=CONCATENATE(A2," ",B2) or =A2&" "&B2
=TEXTJOIN(", ",TRUE,A2:A10)       -- Join range with delimiter

-- Date
=TODAY()                           -- Current date
=NOW()                             -- Current date and time
=YEAR(A2) / =MONTH(A2) / =DAY(A2)
=DATEDIF(A2,B2,"D")               -- Days between dates
=EOMONTH(A2,0)                    -- Last day of month
=WORKDAY(A2,5)                    -- 5 working days from date
=NETWORKDAYS(A2,B2)               -- Working days between dates

-- ── PIVOT TABLE KEYBOARD SHORTCUTS ──────────────────────
Alt+N+V: Insert PivotTable
Alt+D+P: PivotTable Wizard
F5 then PivotTable: Navigate to PivotTable
Ctrl+Shift+Enter: Confirm array formula

-- ── CONDITIONAL FORMATTING ───────────────────────────────
Home -> Conditional Formatting -> New Rule
  - Format cells that contain: [value/text/date]
  - Use formula: =A1>AVERAGE($A$1:$A$100)
  - Color scales: green=high, red=low
  - Data bars: visual in-cell bar chart
  - Icon sets: arrows, traffic lights

-- ── POWER QUERY SHORTCUTS ────────────────────────────────
Data -> Get Data -> From Table/Range
Common transformations:
  - Remove duplicates
  - Split column by delimiter
  - Unpivot columns (wide to tall)
  - Merge queries (like JOIN)
  - Group by (aggregate)
  - Add custom column (M formula)

-- ── KEYBOARD SHORTCUTS ────────────────────────────────────
Ctrl+T: Format as Table
Ctrl+Shift+L: Toggle filters
Ctrl+1: Format cells
F4: Absolute reference / Repeat last action
Ctrl+D: Fill down
Ctrl+R: Fill right
Alt+Enter: New line in cell
Ctrl+`: Toggle show formulas
F11: Create chart from selection
```
