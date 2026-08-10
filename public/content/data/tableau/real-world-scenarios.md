# Tableau — Real World Scenarios

A note on framing: all three scenarios below are composite/illustrative — common, well-documented patterns from BI practice rather than a specific named company's internal project. They're labeled as such throughout rather than presented as verified case studies.

---

## Scenario 1 (illustrative): The dashboard that was accurate and still wrong

**The pattern:** An executive sales dashboard shows "Total Revenue" as a big number in the top-left KPI tile, built with `SUM([Sales])`. It matches the finance team's numbers exactly — for the current default view. Then a regional VP filters to just their region and the number still looks plausible, so nobody questions it. Weeks later, someone realizes the "Total Revenue" tile was actually built with a `{FIXED [Region] : SUM([Sales])}` LOD expression left over from an earlier version of the dashboard, meant to show "revenue for the selected region regardless of product filters." When a user filters by *product category* instead of region, the FIXED calculation ignores that filter (by design — that's what FIXED does) and keeps showing the region's full revenue, silently including products the user just filtered out.

**Why this is a genuinely easy trap, not a one-off mistake:** FIXED expressions are one of Tableau's most powerful features specifically *because* they ignore certain view filters — that's the whole point of using one. The failure mode isn't "FIXED is broken," it's that a calculation built for one filtering context gets reused in a dashboard where users apply a different filter than the one it was designed to ignore, and the number still renders as if nothing is wrong, because arithmetically nothing is.

**What actually prevents this:**
- Document, right in the calculated field's name or description, exactly which filters a FIXED expression is meant to ignore: `Revenue (Fixed at Region — ignores Product/Date filters)` rather than just `Total Revenue`.
- Where possible, prefer `INCLUDE`/`EXCLUDE` over `FIXED` when the intent is "relative to the current view" rather than "always this exact granularity" — they update as filters change in ways `FIXED` won't.
- Add a visible filter summary or "showing: Region = X" text element near any KPI built on a `FIXED` calculation, so the discrepancy is at least visible rather than silent.

---

## Scenario 2 (illustrative): The live-connection dashboard that worked in testing and crawled in production

**The pattern:** A dashboard is built and tested against a live database connection using a development dataset — a few thousand rows, snappy performance. It ships. In production, the underlying table has tens of millions of rows, several calculated fields are computed row-level rather than pre-aggregated, and every filter click re-queries the full table live. The dashboard that felt instant in the demo takes 15-20 seconds per interaction in front of actual users, who stop trusting (and using) it.

**Why the existing course material's own performance advice matters here:** this is exactly the gap between "extract vs. live connection" and "test with realistic data volumes" that this course's Interview and Advanced sections already call out — the mistake isn't not knowing the rule, it's the rule getting skipped because the dev-environment dataset never surfaced the problem.

**What actually prevents this:**
- Test performance against production-scale data volume *before* shipping, not after — a dashboard that's fast on 5,000 rows tells you nothing about its behavior on 50 million.
- Default to an extract (`.hyper`) for anything that doesn't need second-by-second freshness, and schedule refreshes instead of querying live on every interaction.
- Push aggregation into the database layer (a view or a pre-aggregated summary table) rather than relying on Tableau to aggregate raw row-level data on every render — this is the single biggest lever for large datasets, more so than most in-Tableau optimization tricks.
- Use Tableau's own Performance Recorder (Tools → Record Performance) against a production-scale extract before launch, so slow queries or calculations are caught in testing rather than reported by users.

---

## Scenario 3 (illustrative): The color palette that looked fine to the designer and unreadable to a colorblind stakeholder

**The pattern:** A dashboard uses a red/green diverging palette to show "over budget" vs. "under budget" — an extremely common, intuitive-seeming default for financial dashboards. It looks fine to everyone on the team who reviews it before launch. After rollout, a stakeholder with red-green color vision deficiency (the most common form of color blindness, affecting roughly 1 in 12 men) reports that they genuinely cannot tell which regions are over or under budget from the chart alone — the two colors read as nearly identical to them.

**Why this keeps happening even on teams that "know better":** the people building and reviewing a dashboard are rarely a representative sample of everyone who'll eventually use it, and red-green is such a strong visual convention (traffic lights, financial "red ink") that it doesn't occur to most designers to question it until someone who's actually affected says something.

**What actually prevents this:**
- Use a colorblind-safe diverging palette (Tableau ships several under Color → Edit Colors → palette dropdown — orange-to-blue and similar diverging schemes read correctly across the common forms of color vision deficiency, whereas red-green does not).
- Don't rely on color as the *only* encoding for a critical distinction — pair it with position, icon, or a text label (a small ▲/▼ glyph or explicit "+/−" sign next to the number) so the information survives even if the color difference doesn't come through.
- If your organization doesn't already have a documented accessible palette standard for dashboards, this is a cheap, one-time fix worth making before the next dashboard ships, not after the next complaint.
