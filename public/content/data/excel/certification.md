# Excel Certification Guide

## Certifications Available

| Cert | Provider | Cost (verify current pricing at certiport.com — varies by region/reseller and changes over time) |
|------|----------|------|
| **Microsoft Office Specialist (MOS) Excel Associate (MO-200)** | Microsoft | ~$165 |
| **Microsoft Excel Expert (MO-201)** | Microsoft | ~$165 |
| **Excel VBA certification (various)** | Third-party | Varies |

MOS Excel Associate (MO-200): workbooks, formulas, charts, pivot tables, data management -- no VBA/macros. MOS Excel Expert (MO-201) builds on that with advanced formulas, macros/VBA basics, Power Pivot, and What-If Analysis -- start with MO-200 unless you're already comfortable with everything it covers.

---

## Core Skills & Commands

```excel
-- Key formulas for MOS exam
XLOOKUP(lookup, lookup_array, return_array)     -- Modern VLOOKUP
INDEX(array, MATCH(lookup, lookup_col, 0))      -- Flexible lookup
SUMIFS(sum_range, criteria_range1, criteria1)   -- Conditional sum
COUNTIFS(range1, criteria1, range2, criteria2)  -- Conditional count
IF(condition, true_val, false_val)              -- Conditional logic
IFERROR(formula, fallback)                      -- Error handling

-- PivotTable: Insert → PivotTable → drag fields
-- Rows, Columns, Values, Filters
-- Slicers for interactive filtering

-- Power Query: Data → Get Data → From CSV/Web/Database
-- Transform, filter, merge, append queries
-- Refresh All updates all connections

-- Charts: Insert → Charts → Recommended Charts
-- Dynamic charts update automatically with data changes
```

---

## Study Resources

- **GCFGlobal Excel Tutorial** (free, comprehensive basics)
- **ExcelJet** (exceljet.net) — formula reference with examples
- **Microsoft Learn** — official MOS certification learning path
- **Chandoo.org** — advanced Excel and charting techniques

## Revision Notes

```
MOS EXCEL KEY SKILLS:
  Formulas: XLOOKUP, INDEX-MATCH, SUMIFS, COUNTIFS, IFS
  PivotTables: group, filter, calculated fields, slicers
  Power Query: load, transform, merge, refresh
  Charts: dynamic, recommended, formatting
  Data validation, conditional formatting, named ranges
  VLOOKUP is legacy — use XLOOKUP on exam if available
```

---

## MOS Exam Preparation

```
MOS EXCEL ASSOCIATE (MO-200) EXAM DOMAINS -- confirm current domain list at
certiport.com before relying on this, Microsoft revises these periodically:
  Managing Workbooks:        save formats, templates, properties, inspection
  Managing Data:             flash fill, data validation, conditional formatting
  Managing Tables:           create, format, filter, calculated columns
  Formulas and Functions:    named ranges, IF/IFS, XLOOKUP, array formulas
  Create Charts:             types, formatting, trendlines, sparklines
  PivotTables and PivotCharts: create, configure, slicer, timeline

EXAM FORMAT:
  Performance-based: you actually use Excel (not MCQ)
  Approximately 35 tasks across 5 projects
  Proctored at Certiport testing centres
  Scored 1-1000 with an undisclosed cut score, not a published percentage --
  "70%+" is a common informal approximation, not Microsoft's own stated
  scoring method; don't rely on it as an exact number
```

---
