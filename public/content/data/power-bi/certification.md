# Power Bi Certification Guide

## Certifications Available

| Cert | Provider | Cost |
|------|----------|------|
| **PL-300: Power BI Data Analyst** | Microsoft | $165 |
| **DP-900: Azure Data Fundamentals** | Microsoft | $165 |

PL-300 is the primary Power BI cert. 50-60 questions, 120 min, 700/1000 passing.

---

## Core Skills & Commands

```dax
-- PL-300 DAX essentials
Total Sales = SUM(Orders[Amount])
Average Order = AVERAGE(Orders[Amount])
Sales YTD = TOTALYTD([Total Sales], Dates[Date])
Sales LY = CALCULATE([Total Sales], SAMEPERIODLASTYEAR(Dates[Date]))
Growth % = DIVIDE([Total Sales] - [Sales LY], [Sales LY])

-- CALCULATE: change filter context
Sales USA = CALCULATE([Total Sales], Customers[Country] = "USA")
Top 10 Sales = CALCULATE([Total Sales], TOPN(10, Products, [Total Sales], DESC))

-- Variables for readability
Margin % =
VAR revenue = [Total Sales]
VAR cost = [Total Cost]
RETURN DIVIDE(revenue - cost, revenue)

-- Time intelligence (requires date dimension table!)
Sales MTD = TOTALMTD([Total Sales], Dates[Date])
Sales Rolling 3M = CALCULATE([Total Sales],
    DATESINPERIOD(Dates[Date], LASTDATE(Dates[Date]), -3, MONTH))
```

---

## Study Resources

- **Microsoft Learn PL-300** (free, official, includes practice labs)
- **Guy in a Cube** (YouTube) — best free Power BI channel
- **SQLBI** (dax.guide) — definitive DAX reference
- **ExamTopics PL-300** — community practice questions

## Revision Notes

```
PL-300 KEY TOPICS:
  Data model: star schema (fact + dimension tables)
  DAX: SUM/COUNT/AVERAGE | CALCULATE (context modifier) | time intelligence
  Relationships: many-to-one | active vs inactive
  Power Query: M language, merge/append, transformations
  RLS: filter data by user identity
  Publish: Power BI Service, schedule refresh, share
  
CALCULATED COLUMN vs MEASURE:
  Column: computed per row, stored in model, use for filtering
  Measure: computed on demand, context-aware, use for aggregations
```
