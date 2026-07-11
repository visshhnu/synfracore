# Dashboarding — Notes

## Core mental model

- "Define the question" is the most-skipped step and the root cause of most unused dashboards — who's the user, what decision, what's the ONE most important metric, what time window.
- A dashboard built from available data ("we have this data, let's visualize it") rather than an actual stakeholder decision routinely ends up unfocused, with no clear hero metric.
- Wireframing before building is the cheap step that prevents expensive rework — a stakeholder review of a rough box layout catches priority/layout mistakes for free, before hours of actual building.

## Layout and design

- The Z/F eye-scan pattern is evidence-based, not arbitrary — top-left is genuinely scanned first, which is why the single most important metric belongs there.
- Matching dashboard type (Operational/Strategic/Analytical/Tactical) to actual audience matters — building the wrong type for the audience produces a dashboard that's technically correct but poorly suited to how it's actually used.
- Tool choice (Power BI vs. Tableau) matters less than getting the design process right — a well-scoped dashboard in either tool outperforms a poorly-scoped one in the "better" tool.

## DAX / calculated fields

- `CALCULATE` re-evaluates an expression under a modified filter context — this is the core mechanism behind time-intelligence functions like `SAMEPERIODLASTYEAR`, and understanding it deliberately (not as magic syntax) is what lets you build correct, reusable measures.
- A dedicated Date Table (not a raw fact-table date column) is required for time-intelligence functions to work correctly — a common, genuinely hard-to-diagnose bug comes from skipping this, since it only breaks for date ranges that happen to include a gap.

## Interactivity and security

- Cross-filtering (clicking one chart filters others) is valuable for exploratory/analyst dashboards, but can be confusing for executive-facing dashboards where an accidental click unexpectedly filters the whole page — worth disabling deliberately for that audience.
- Row-level security lets one dashboard serve different data per viewer — the real value beyond convenience is maintainability: a layout/metric change applies correctly to every viewer automatically, rather than needing replication across N separately-maintained copies.

## Scale and performance

- Incremental refresh (archiving old data, only reprocessing recent) is necessary once a fact table reaches real production scale — full-refresh approaches that were fine at launch quietly become a performance problem as data grows, often without any specific "breaking change" to point to.
- Diagnose slow dashboards systematically: query type (DirectQuery vs. extract) → visual count per page → high-cardinality visuals → inefficient DAX — use the platform's built-in profiler (Performance Analyzer/Performance Recording), don't guess which visual "feels slow."

## Trust and refresh cadence

- A trust gap in dashboard numbers is often not an accuracy problem — it's an unexplained discrepancy with a number the stakeholder already trusted from elsewhere. Visible "last refreshed" timestamps and documented metric definitions (what's included/excluded) are what actually rebuild trust.
- Refresh cadence should match actual decision cadence, not "as often as technically possible" — over-provisioning refresh frequency is a real, avoidable cost with no decision-quality benefit for a dashboard reviewed weekly.
