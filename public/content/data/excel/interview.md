# Microsoft Excel Interview Questions

## Core Concepts

**Q: Essential Excel functions for data analysis.**

```excel
-- LOOKUP functions
=VLOOKUP(A2, Sheet2!A:C, 3, FALSE)     -- Find value in table (col 3, exact match)
=XLOOKUP(A2, Sheet2!A:A, Sheet2!C:C)  -- Modern replacement for VLOOKUP
=INDEX(C:C, MATCH(A2, A:A, 0))        -- INDEX-MATCH: more flexible than VLOOKUP

-- Conditional
=IF(A2>100, "High", IF(A2>50, "Medium", "Low"))   -- Nested IF
=IFS(A2>100, "High", A2>50, "Medium", TRUE, "Low") -- Cleaner multi-condition
=SUMIF(B:B, "Sales", C:C)             -- Sum where condition is true
=COUNTIFS(B:B, "Sales", C:C, ">1000") -- Count with multiple conditions
=AVERAGEIFS(D:D, B:B, "Sales", C:C, ">1000")

-- Text
=CONCATENATE(A2, " ", B2)  -- or =A2&" "&B2
=LEFT(A2, 3)  =RIGHT(A2, 3)  =MID(A2, 2, 4)  =LEN(A2)
=TRIM(A2)         -- Remove extra spaces
=TEXT(A2,"DD/MM/YYYY")  -- Format as text
=UPPER(A2) =LOWER(A2) =PROPER(A2)

-- Date
=TODAY()  =NOW()  =YEAR(A2)  =MONTH(A2)  =DAY(A2)
=DATEDIF(A2, B2, "D")  -- Days between dates
=EDATE(A2, 3)           -- Date 3 months later
=EOMONTH(A2, 0)         -- Last day of month

-- Statistical
=AVERAGE(A1:A100)  =MEDIAN()  =MODE()  =STDEV()
=PERCENTILE(A1:A100, 0.95)    -- 95th percentile
=RANK(A2, A1:A100, 1)         -- Rank ascending
```

---

**Q: PivotTable — when and how?**

PivotTables summarise large datasets quickly without writing formulas.

```
Data: Order ID | Product | Region | Sales | Date

PivotTable:
  Rows: Region
  Columns: Product category
  Values: Sum of Sales (default), Count, Average
  Filters: Year (slicer for interactive filtering)

Result:
            Electronics  Clothing  Total
North       ₹45,000      ₹23,000   ₹68,000
South       ₹38,000      ₹31,000   ₹69,000
Total       ₹83,000      ₹54,000   ₹137,000
```

**PivotChart**: Dynamic chart linked to PivotTable — updates when you change filters.

**Calculated field**: Add custom formulas inside PivotTable.
`Profit Margin = (Sales - Cost) / Sales`

---

**Q: Excel data validation and named ranges.**

```excel
-- Data validation: restrict input to specific values
Data → Data Validation → List → Source: "Low,Medium,High"
-- Or reference a range: Source: =$E$1:$E$5

-- Named ranges: give ranges meaningful names
Name Box → type "SalesData" → press Enter
-- Use in formulas: =SUM(SalesData) instead of =SUM(A1:A500)
-- CTRL+F3 to manage named ranges

-- Dynamic named range with OFFSET:
=OFFSET($A$1, 0, 0, COUNTA($A:$A), 1)  -- Expands automatically
```

---

**Q: Power Query for data transformation.**

Power Query (Get & Transform): Import, clean, and transform data without VBA.

```
Get Data → From CSV/Excel/Database/Web
Transform:
  - Remove columns
  - Filter rows (like WHERE in SQL)
  - Split column by delimiter
  - Pivot/Unpivot columns
  - Merge queries (like JOIN)
  - Add calculated column (like computed field)
  - Change data types
  - Handle errors/nulls
Load → To worksheet or data model
```

**Advantage**: Refresh updates all transformations automatically (click Refresh All). No manual re-doing.

---

**Q: Excel vs Power BI — when to use each?**

| | Excel | Power BI |
|---|---|---|
| Best for | Ad-hoc analysis, small-medium data | Dashboards, large data, sharing |
| Data limit | ~1M rows per sheet | Hundreds of millions of rows |
| Collaboration | File-based (email/SharePoint) | Cloud (Power BI Service, Teams) |
| Visualisations | Basic charts + pivot charts | 100+ custom visuals |
| Refresh | Manual or scheduled | Automatic scheduled refresh |
| Learning curve | Low | Medium |

Use Excel when: you need flexible ad-hoc analysis, formulas/macros, data is small-medium.
Use Power BI when: enterprise dashboards, large data, multiple stakeholders need live reports.

## Revision Notes
```
KEY FUNCTIONS:
XLOOKUP: modern VLOOKUP (works left, handles errors, dynamic array)
INDEX-MATCH: flexible lookup (returns row/column position then value)
SUMIFS/COUNTIFS: aggregate with multiple conditions
IFS: cleaner than nested IF

PIVOT TABLE: summarise data without formulas
Rows + Columns + Values + Filters | Calculated fields | Slicers

POWER QUERY: import + transform pipeline (no VBA needed)
Refresh updates all transformations automatically

DATA VALIDATION: restrict input to list/range
NAMED RANGES: meaningful names for ranges, dynamic with OFFSET

Excel vs Power BI:
Excel: flexible, small-medium data, ad-hoc
Power BI: dashboards, large data, enterprise sharing
```
