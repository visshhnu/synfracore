# Dashboarding — Quick Reference

## Dashboard build process

```
1. Define the question — who's the user, what decision, what's the ONE
   most important metric, what time window
2. Wireframe the layout — before touching any tool
3. Build — connect data, transform, create measures, add visuals + filters
4. Publish + set refresh schedule matched to actual decision cadence
```

## Dashboard types, at a glance

| Type | Audience | Refresh |
|---|---|---|
| Operational | Teams, managers | Real-time/hourly |
| Strategic | C-suite | Daily/weekly |
| Analytical | Analysts | On-demand |
| Tactical | Team leads | Daily |

## Common DAX measures (Power BI)

```dax
Total Revenue = SUM(Orders[Sales])
Revenue LY = CALCULATE([Total Revenue], SAMEPERIODLASTYEAR(Dates[Date]))
YoY Growth % = DIVIDE([Total Revenue] - [Revenue LY], [Revenue LY])
Revenue YTD = TOTALYTD(SUM(Sales[Revenue]), Dates[Date])
Profit Ratio = DIVIDE([Total Profit], [Total Revenue])
```

## Dedicated date table (required for time intelligence)

```dax
Dates = CALENDAR(DATE(2020,1,1), DATE(2026,12,31))
Year = YEAR(Dates[Date])
Quarter = "Q" & FORMAT(Dates[Date], "Q")
-- Must be marked as a "Date Table" in the model for time-intelligence
-- functions (SAMEPERIODLASTYEAR, TOTALYTD) to work correctly
```

## Tableau calculated field equivalent

```
Profit Ratio: SUM([Profit]) / SUM([Sales])
```

## Row-level security (Power BI)

```dax
[Region] = LOOKUPVALUE(Users[Region], Users[Email], USERPRINCIPALNAME())
-- Assign this role to users/groups in Power BI Service;
-- test with "View As Roles" before publishing
```

## Common mistakes checklist

```
[ ] Skipping "define the question" — building from available data instead
[ ] Too many KPIs (pick top 5 max for the hero row)
[ ] Most important metric NOT top-left (fights the natural Z/F eye scan)
[ ] No mobile layout considered
[ ] Static data / no refresh schedule set
[ ] No context (no comparison vs. last period or target)
[ ] Color used decoratively, not meaningfully
[ ] Raw fact-table date column used instead of a proper Date Table
```

## Performance diagnosis order (slow dashboard)

```
1. Underlying query — DirectQuery/live connection vs. pre-aggregated extract
2. Visual count per page — too many visuals each issuing their own query
3. High-cardinality visuals — rendering thousands of individual rows
4. Inefficient DAX/calculated-field logic
Use Power BI Performance Analyzer / Tableau Performance Recording
to find the actual slow component — don't guess.
```

## Refresh cadence — match to actual decision cadence

```
Operational dashboard → near-real-time refresh genuinely needed
Strategic dashboard (weekly review) → daily refresh is plenty;
  over-provisioning refresh frequency = real cost, no decision benefit
```
