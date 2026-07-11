# Dashboarding — Intermediate

## DAX measures: the calculation layer that makes Power BI dashboards actually work

DAX (Data Analysis Expressions) measures are calculated on-the-fly at query time, based on whatever filters (slicers, drill-downs) are currently applied — this is a fundamentally different mental model from a static Excel formula computed once against fixed cells:

```dax
Total Revenue = SUM(Orders[Sales])

Revenue LY = CALCULATE([Total Revenue], SAMEPERIODLASTYEAR(Dates[Date]))

YoY Growth % = DIVIDE([Total Revenue] - [Revenue LY], [Revenue LY])

Revenue YTD = TOTALYTD(SUM(Sales[Revenue]), Dates[Date])
```
The `CALCULATE` function is the core of DAX's real power, worth understanding deliberately rather than treating as magic syntax — it re-evaluates an expression under a modified filter context, which is exactly how `SAMEPERIODLASTYEAR` works: it computes `[Total Revenue]` again, but as if the current date filter were shifted back one year, automatically respecting whatever other filters (region, product category) are already active from the dashboard's slicers. This is what makes a single YoY Growth measure correctly recompute for every possible slicer combination a user selects, without writing separate logic for each combination.

## Dedicated date tables: why "just use the date column" causes real problems

A common early mistake is filtering and grouping directly on a raw date column in the fact table rather than building a dedicated date dimension table — this works for simple cases but breaks down for time-intelligence functions like `SAMEPERIODLASTYEAR` and `TOTALYTD`, which specifically require a proper, continuous date table (marked as such in the data model) to function correctly:

```dax
-- A dedicated Dates table, marked as a Date Table in the model
Dates = CALENDAR(DATE(2020,1,1), DATE(2026,12,31))
Year = YEAR(Dates[Date])
Month = FORMAT(Dates[Date], "MMM")
Quarter = "Q" & FORMAT(Dates[Date], "Q")
```
The Date Table exists specifically to guarantee every date in the analysis range is represented continuously, even dates with zero transactions — a raw fact-table date column skips days with no orders entirely, which silently breaks any time-intelligence calculation relying on a continuous date sequence. Building this correctly from the start avoids a genuinely common, hard-to-diagnose class of bug where YoY/YTD measures return subtly wrong numbers only for date ranges that happen to include a gap.

## Filters and interactions: global vs. local, and cross-filtering

```
Global filter/slicer  — applies to every visual on the page (a date range picker)
Local filter          — applies to one specific visual only
Cross-filter action    — clicking a mark in one chart filters other charts on the page
```
Tableau's "actions" and Power BI's cross-filtering both let clicking a bar in one chart automatically filter the other visuals on the page (clicking "West" in a regional bar chart filters the trend line and product table to just West region data) — this is genuinely valuable for exploratory, analyst-facing dashboards, letting a user drill into a specific segment without manually re-configuring every filter. It's worth being deliberate about which visuals participate in cross-filtering, though — an executive-facing dashboard where an accidental click unexpectedly filters the entire page can be confusing rather than helpful, and disabling cross-filtering for specific visuals (keeping them as fixed reference context) is often the right choice for that audience.

## Refresh scheduling: matching cadence to actual decision cadence

```
Power BI Service — Settings → Scheduled refresh → Daily at 6:00 AM
```
The refresh cadence should be driven by how often the underlying decision actually needs current data, not by "as often as technically possible" — an hourly refresh on a dashboard reviewed only in a weekly meeting adds real, unnecessary load on the data source for no corresponding benefit, while a daily refresh on a dashboard meant to catch same-day operational issues is too slow for its actual purpose. This connects directly back to the dashboard-type table from the Fundamentals tab: an Operational dashboard genuinely needs near-real-time refresh; a Strategic dashboard reviewed weekly by leadership does not, and over-provisioning refresh frequency for it is a real, avoidable cost with no actual decision-quality benefit.

## Building the same dashboard in Tableau: the calculated-field equivalent

```
Profit Ratio: SUM([Profit]) / SUM([Sales])
```
Tableau's calculated fields serve the same conceptual role as Power BI's DAX measures — a formula computed at query time under the current filter context — though Tableau's syntax and mental model (built around "dimensions" and "measures" dragged onto shelves) differs meaningfully from DAX's more formula-language feel. The underlying dashboard-design principles from the Fundamentals tab (define the question first, wireframe before building, most important metric top-left) apply identically regardless of which tool is used to implement them — tool choice affects execution, not the design thinking that should precede it.
