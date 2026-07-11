# Dashboarding — Advanced

## Row-level security: one dashboard, different data per viewer

A single published dashboard can serve different data to different users based on their identity — a regional sales manager sees only their region's data, without needing a separate dashboard built per region:

```dax
-- Power BI RLS role — filters the Orders table to the logged-in user's region
[Region] = LOOKUPVALUE(Users[Region], Users[Email], USERPRINCIPALNAME())
```
This is set up as a role in the data model, then assigned to specific users or groups in the Power BI Service — the underlying report/dashboard definition stays identical for everyone, but the actual data returned is filtered per-viewer at query time. The real value beyond convenience (one dashboard instead of N regional copies) is maintainability: a layout or metric change made once applies correctly to every viewer's filtered view automatically, rather than needing to be manually replicated across N separately-maintained regional dashboards, which is exactly the kind of duplication that reliably drifts out of sync over time if not centralized.

## Composite/incremental data models for genuinely large datasets

A Power BI/Tableau extract that re-imports an entire multi-year fact table on every scheduled refresh becomes impractically slow once that table reaches real production scale (tens of millions of rows) — incremental refresh solves this by only reprocessing recent data, not the full history on every run:

```
Power BI Incremental Refresh policy:
  Archive data older than 2 years  (loaded once, never reprocessed)
  Refresh the last 10 days         (reprocessed on every scheduled run)
```
This is a direct performance/cost tradeoff worth understanding, not just configuring blindly: incremental refresh dramatically reduces refresh time and underlying data-source load for large fact tables, at the cost of some added complexity in defining the correct partitioning boundary (which column determines "recent" vs. "archived," and whether that boundary genuinely never needs older data reprocessed — a late-arriving correction to two-year-old data would be silently missed under an incremental policy that assumes archived data is immutable).

## Embedded analytics: dashboards inside a product, not a standalone BI tool

Beyond internal-facing dashboards viewed in Power BI Service or Tableau Server, both platforms support embedding a dashboard directly inside a separate application via an SDK/API — a SaaS product's own "Analytics" tab showing a customer their own usage data, rendered by an embedded Power BI or Tableau report rather than a custom-built charting UI:

```javascript
// Power BI embedded — rendering a report inside a custom web app
import { PowerBIEmbed } from 'powerbi-client-react';

<PowerBIEmbed
  embedConfig={{
    type: 'report',
    id: reportId,
    embedUrl: embedUrl,
    accessToken: accessToken,   // scoped per-tenant via row-level security
  }}
/>
```
This pattern is genuinely valuable specifically because it reuses the BI tool's existing visualization/interaction capability (filtering, drill-down, export) rather than a product team building and maintaining custom charting UI from scratch — combined with row-level security, the same embedded report definition can correctly show each customer only their own data, without a separate report per customer. The real cost tradeoff: embedded analytics licensing is typically priced differently (and can be significantly more expensive at scale) than internal-only BI licensing, worth confirming explicitly with the platform's current pricing model before committing to this architecture for a customer-facing feature.

## Dashboard performance at scale: diagnosing a slow load, systematically

A dashboard that loads slowly has a limited, specific set of real causes, worth checking in a deliberate order rather than guessing: **the underlying query itself** (a poorly optimized data source query, or a DirectQuery/live-connection mode hitting the source database on every interaction rather than querying a pre-aggregated extract); **excessive visual count on one page** (a page crammed with 20+ visuals each issuing their own query, versus a page with fewer, more focused visuals); **high-cardinality visuals** (a table or chart rendering thousands of individual rows/marks rather than an aggregated summary); or **inefficient DAX/calculated-field logic** (a measure that recalculates an expensive aggregation from scratch for every row rather than using a pre-computed or more efficient formulation). Profiling tools built into both platforms (Power BI's Performance Analyzer, Tableau's Performance Recording) show per-visual and per-query timing directly — using that data to identify the actual slowest component, rather than guessing which visual "feels slow," is what turns a vague performance complaint into a specific, fixable diagnosis.
