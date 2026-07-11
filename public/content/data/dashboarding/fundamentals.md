# Dashboarding — Fundamentals

## Starting from the question, not the tool

The Overview tab's Step 1 ("Define the Question") is the single most-skipped step in real dashboard building, and skipping it is the root cause of most dashboards that get built, launched, and then quietly stop being used. Before opening Power BI or Tableau, the questions that actually determine everything downstream:

```
Who is the user, specifically?             (not "the team" — a named role)
What decision do they make with this?       (if there's no decision, it's a
                                              report, not a dashboard)
What's the ONE most important metric?        (if you can't name one, the
                                              dashboard has no clear hero)
What time window matters?                    (today? this week? QTD? YTD?)
```
A dashboard built by exploring available data first ("we have this data, let's visualize it") routinely ends up with too many charts, none clearly prioritized, because no one ever forced the "what's the one most important metric" decision — starting from the decision the dashboard needs to support, and working backward to which data actually serves that decision, produces a meaningfully more focused result than starting from the data.

## Matching dashboard type to actual audience

| Type | Audience | Focus | Update frequency |
|---|---|---|---|
| Operational | Teams, managers | Day-to-day KPIs | Real-time/hourly |
| Strategic | C-suite, leadership | Business metrics | Daily/weekly |
| Analytical | Analysts, data scientists | Deep-dive exploration | On-demand |
| Tactical | Team leads | Progress against targets | Daily |

Building a strategic-type dashboard (few headline KPIs, daily refresh) for an operational audience (who need real-time, granular, day-to-day visibility) — or the reverse — is a common mismatch that produces a dashboard technically showing correct data but genuinely unsuited to how its actual audience needs to use it. Confirming which type is actually needed, from the "who is the user" question above, before designing layout is what prevents this.

## Wireframing before building: the cheap step that prevents expensive rework

```
┌─────────────┬─────────────┬─────────────┐
│ KPI: Revenue│ KPI: Users  │ KPI: Churn  │ ← Top row: headline metrics
├─────────────┴─────────────┴─────────────┤
│ Revenue Trend (Line Chart - 12 months)  │ ← Main chart
├────────────────────┬────────────────────┤
│ Top Products (Bar) │ Revenue by Region  │ ← Supporting charts
└────────────────────┴────────────────────┘
```
A rough wireframe — even a hand-drawn box layout — sketched and reviewed with the actual stakeholder *before* building anything in the BI tool catches layout and priority problems while they cost nothing to fix. Discovering during a stakeholder review, after hours of building, that the "most important metric" they actually care about isn't the one placed top-left is a genuinely avoidable cost — five minutes of wireframe review upfront routinely saves hours of rebuild later.

## The Z/F eye-scan pattern: why placement isn't arbitrary

Eye-tracking research on how people scan a screen shows a consistent pattern — top-left first, then across, then down — which is the direct reason "most important metric top-left" (from the Overview tab) is a real, evidence-based design rule rather than an arbitrary convention. A dashboard that places its single most important number in the bottom-right corner is fighting against how viewers naturally scan a page, and that metric will be the one most often missed on a quick glance — which matters specifically because most real dashboard usage is a quick glance, not a careful top-to-bottom read.

## Picking a tool: Power BI vs. Tableau, as a starting decision

Both tools solve the same fundamental problem — the practical starting decision usually comes down to existing infrastructure and team skillset rather than a strict feature comparison:

- **Power BI** — the natural default in a Microsoft-centric environment (already using SQL Server, SharePoint, Azure, Excel), and its DAX formula language is conceptually closer to Excel formulas, which shortens the learning curve for teams already fluent in Excel
- **Tableau** — historically stronger for genuinely exploratory, drag-and-drop visual analysis, with a design philosophy more oriented toward analysts building complex custom views quickly

For a first dashboard, this decision matters less than actually working through the "define the question → wireframe → build" process correctly — a well-designed dashboard built in either tool outperforms a poorly-scoped one built in the "better" tool, and switching tools later is a real but bounded cost, while a dashboard built without clear purpose is a cost that repeats every time someone tries and fails to get value from it.
