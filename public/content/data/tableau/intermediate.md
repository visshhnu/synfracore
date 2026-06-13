# Tableau — Intermediate

## Calculated Fields

```
Create: Right-click in Data pane → Create Calculated Field
Syntax is similar to Excel formulas

-- String functions
UPPER([Customer Name])
TRIM([Email])
LEFT([Order ID], 6)
CONTAINS([Notes], "urgent")
SPLIT([Full Name], " ", 1)  -- First name

-- Date functions
YEAR([Order Date])
DATEDIFF('day', [Order Date], [Ship Date])
DATETRUNC('month', [Order Date])  -- First day of month
TODAY() - [Order Date]

-- Logic
IF [Sales] > 10000 THEN "High"
ELSEIF [Sales] > 5000 THEN "Medium"
ELSE "Low" END

IIF([Profit] > 0, "Profitable", "Loss")

CASE [Region]
    WHEN "North" THEN "Northern"
    WHEN "South" THEN "Southern"
    ELSE "Other"
END

-- Aggregations (create at aggregate level)
SUM([Sales]) / SUM([Quantity])    -- Avg price
SUM([Profit]) / SUM([Sales])      -- Profit margin
WINDOW_AVG(SUM([Sales]))          -- Table calculation: running avg
RUNNING_SUM(SUM([Sales]))         -- Cumulative sum
```

## Level of Detail (LOD) Expressions

```
-- Fixed: Compute at specific granularity, ignore view's level
{FIXED [Region] : SUM([Sales])}   -- Region total regardless of view detail

-- Example: Show each order's % of its customer's total
Order % of Customer =
SUM([Sales]) / {FIXED [Customer ID] : SUM([Sales])}

-- Include: Add dimension to current view's level
{INCLUDE [Customer ID] : AVG(SUM([Sales]))}  -- Avg customer sales in each region

-- Exclude: Remove dimension from current view's level
{EXCLUDE [Product] : SUM([Sales])}  -- Regional total (ignoring product breakdown)
```

## Dashboard Actions

```
Filter action: Click a mark → filter other sheets
  Dashboard → Actions → Add Action → Filter
  Source sheet: Map
  Target sheet: Bar chart
  "Filter" on: selected marks

Highlight action: Click a mark → highlight same value in other sheets
  Useful for comparing same customer across multiple views

URL action: Click a mark → open external URL
  URL: https://crm.example.com/customer/[Customer ID]

Parameter action: Click a mark → set a parameter value
  Use with calculated fields to dynamically change what's shown
```
