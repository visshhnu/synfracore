# Power BI — Advanced + Interview + Cheatsheet

## Row-Level Security (RLS)

```dax
-- Restrict data by current user's region
-- In Manage Roles: Create "RegionManager" role
-- Add DAX filter on Geography table:
[RegionManager] = USERPRINCIPALNAME()

-- Or use a security table
PATHCONTAINS(
    PATH(SecurityTable[ManagerEmail], SecurityTable[EmployeeEmail]),
    USERPRINCIPALNAME()
)
```

## Performance Optimization

```
Query folding: Ensure Power Query pushes transformations to the source
  Signs it's working: Native query option available in steps
  Common fold-breakers: Adding index column, some custom functions

Import mode optimization:
  Star schema (small dims + large fact) > other schemas
  Disable Auto Date/Time (creates hidden tables)
  Remove unused columns at source
  Aggregate tables for high-cardinality fact tables

DirectQuery optimization:
  Add composite models (mix Import + DirectQuery)
  Use aggregations for summary queries
  Avoid complex DAX measures in DirectQuery

DAX optimization:
  Use variables (calculate once, reference multiple times)
  Avoid FILTER(ALL()) when CALCULATETABLE works
  Use DIVIDE() instead of / (handles divide by zero)
  Context transition (SUMX vs SUM) — understand row vs filter context
```

## Power BI Interview + Cheatsheet

```
# ── KEY INTERVIEW QUESTIONS ───────────────────────────────
Q: What is the difference between a measure and a calculated column?
A: Calculated column: computed at data refresh, stored in model, uses row context
   Measure: computed at query time, not stored, uses filter context
   Use measures for aggregations (SUM, COUNT, AVG)
   Use calculated columns for row-level attributes (Full Name = First & Last)

Q: What is context transition in DAX?
A: When a row context (from iterating) is converted to filter context by CALCULATE.
   SUMX(Sales, CALCULATE(SUM(Sales[Amount]))) — CALCULATE converts the row iterator
   context to a filter context, so SUM operates on just the current row.

Q: Difference between FILTER and CALCULATE?
A: CALCULATE modifies the filter context using simple conditions.
   FILTER is a table function that returns a filtered table.
   CALCULATE([Measure], Region = "North") is faster than
   CALCULATE([Measure], FILTER(ALL(Region), Region[Name] = "North"))
   Use CALCULATE for simple conditions; FILTER for complex table operations.

Q: What is a star schema and why does Power BI prefer it?
A: One central fact table (transactions) surrounded by dimension tables (who, what, when, where).
   Power BI engine (VertiPaq) is optimized for star schemas.
   Better compression (repeated values in dimensions stored once),
   faster queries (simple one-hop joins), clearer relationships.

# ── DAX QUICK REFERENCE ───────────────────────────────────
CALCULATE([M], filter1, filter2)     -- Modify filter context
CALCULATETABLE(table, filter)        -- Filtered table
FILTER(table, condition)             -- Return filtered table
ALL(table/column)                    -- Remove all filters
ALLEXCEPT(table, col1, col2)        -- Keep only specified filters
RELATED(Table[Column])               -- Get value from related table
RELATEDTABLE(Table)                  -- Get related rows as table
DIVIDE(num, den, alternate)          -- Safe division
SELECTEDVALUE(col, alternate)        -- Get selected slicer value
HASONEVALUE(col)                     -- Check if single value selected
ISFILTERED(col) / ISCROSSFILTERED()  -- Check if filters active
```
