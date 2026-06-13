# Power BI — Intermediate

## DAX (Data Analysis Expressions)

```dax
-- Basic measures
Total Revenue = SUM(Sales[Amount])
Order Count = COUNTROWS(Sales)
Avg Order Value = DIVIDE([Total Revenue], [Order Count], 0)

-- Time intelligence
Revenue YTD = TOTALYTD([Total Revenue], 'Date'[Date])
Revenue LY = CALCULATE([Total Revenue], SAMEPERIODLASTYEAR('Date'[Date]))
Revenue Growth % = DIVIDE([Total Revenue] - [Revenue LY], [Revenue LY])

-- Running total
Revenue Running Total =
CALCULATE(
    [Total Revenue],
    FILTER(
        ALL('Date'),
        'Date'[Date] <= MAX('Date'[Date])
    )
)

-- Rank products by revenue
Product Rank =
RANKX(
    ALL('Product'[ProductName]),
    [Total Revenue],
    ,
    DESC
)

-- Variable usage (cleaner complex calculations)
Profit Margin =
VAR TotalRevenue = SUM(Sales[Amount])
VAR TotalCost = SUM(Sales[Cost])
VAR Profit = TotalRevenue - TotalCost
RETURN DIVIDE(Profit, TotalRevenue, 0)

-- CALCULATE (most powerful DAX function)
-- Modifies filter context
Revenue North Region =
CALCULATE([Total Revenue], Region[RegionName] = "North")

Revenue Top 10 Products =
CALCULATE(
    [Total Revenue],
    TOPN(10, 'Product', [Total Revenue], DESC)
)
```

## Data Modeling

```
Star schema (recommended for Power BI):
  Fact table: Sales (large, many rows, foreign keys)
  Dimension tables: Customer, Product, Date, Geography

Relationship types:
  One-to-many: One product → many sales (most common)
  Many-to-many: Students ↔ Courses (use with caution, slower)
  Active vs Inactive: Only one active relationship between tables

Date table (critical for time intelligence):
  Mark as Date Table in the model
  Must have contiguous dates with no gaps
  Contains: Date, Year, Quarter, Month, Week, Day of Week

Best practices:
  ✅ Hide foreign key columns (show only dimension attributes)
  ✅ Name measures with format: [Revenue (USD)] not plain "Revenue"
  ✅ Put all measures in a dedicated Measures table
  ✅ Use bidirectional filters sparingly (performance impact)
  ✅ Avoid many-to-many unless necessary
```
