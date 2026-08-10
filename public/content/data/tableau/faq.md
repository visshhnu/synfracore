# Tableau — FAQ

## Is a field's color (blue vs. green) the same thing as it being a Dimension vs. Measure?

Not quite, though they usually line up. **Blue = discrete, green = continuous** is the actual rule; **Dimension vs. Measure** is a separate property. By default, most dimensions (Region, Category) are discrete → blue, and most measures (Sales, Profit) are continuous → green — which is why the simplified "blue = dimension, green = measure" shorthand mostly works in practice. But either can be converted: a Date field is a dimension yet can be made continuous (green) for a continuous timeline instead of discrete year/month headers, and a measure like Year can be made discrete (blue) if you want it to behave like a category rather than an axis. If a pill's color doesn't match what you expected, right-click it and check whether it's set to discrete or continuous — that's usually the actual answer, not a "dimension became a measure" mystery.

## Why does my calculated field say it can't be created, or gives an "aggregate and non-aggregate" error?

This happens when you mix an aggregated field (like `SUM([Sales])`) and a non-aggregated field (like `[Region]`) in a context where Tableau can't tell what granularity to compute at — e.g., `SUM([Sales]) / [Target]` where `[Target]` is a raw, non-aggregated field. Fix by either aggregating the other side too (`SUM([Sales]) / SUM([Target])`), or, if you need row-level granularity mixed with an aggregate, that's exactly the situation an LOD expression exists for.

## What's actually different between a Table Calculation and an LOD Expression? They both seem to "compute differently than the raw data."

Table calculations (`RUNNING_SUM`, `RANK`, `WINDOW_AVG`, `LOOKUP`) operate on the data *that's already in the view* — they compute across the rows/columns currently rendered, which means they can behave unexpectedly if you change what's on the view (add/remove a dimension) because that changes what rows the table calc is running across. LOD expressions (`FIXED`/`INCLUDE`/`EXCLUDE`) compute against the underlying data at a specified granularity *before* the view's aggregation happens, so they're more stable when you rearrange the view — a `{FIXED [Customer ID]: SUM([Sales])}` means the same thing whether or not Region is also on the view. Rule of thumb: if the calculation's meaning should depend on what's currently on the view (running totals, rank within the visible rows), use a table calculation. If the calculation's meaning should stay fixed regardless of the view's layout (customer lifetime total, cohort first-purchase date), use an LOD expression.

## My dashboard filter isn't affecting one of the sheets — why?

A few common causes: (1) that sheet uses different field names or a different data source than the one the filter is applied to — filters only propagate to sheets using the same underlying field; (2) the filter is set to apply to "Selected Worksheets" rather than "All Using This Data Source," and the sheet in question wasn't selected; (3) the sheet has its own local filter that's overriding or conflicting with the dashboard-level filter. Check Filter → Apply to Worksheets on the filter card to confirm scope.

## Should I always use Extracts instead of Live Connections?

No — it depends on the freshness requirement, not just performance. Extracts are the better default for most analytical/exploratory dashboards where near-real-time data isn't essential, because they're dramatically faster and reduce load on the source database. Live connections are the right call when the dashboard genuinely needs current-to-the-second data (operational monitoring, financial trading dashboards) and the underlying database can handle the query load — in which case the "cost" of live querying is the actual point, not a mistake.

## Why did my "Top 10" filter show fewer or different results than expected once I added another filter?

This is almost always the filter-order issue: regular filters (including a Top N filter) all evaluate against the same full dataset independently by default, rather than sequentially against each other's results. If you want "Top 10 within the currently-filtered Region," the Region filter needs to be set as a **Context filter** so it's applied first and the Top N filter then operates on that already-filtered subset — otherwise the Top N is computed against the entire unfiltered dataset and only coincidentally looks "wrong" once you add the Region filter.

## What's the actual maximum number of marks a dashboard can handle before it gets slow?

There's no single universal number — it depends on mark type, hardware, and whether you're on a live connection or an extract. You'll see different guidance in different places (including within this course's own material) citing anywhere from roughly 5,000 marks as a "start being careful" threshold for interactive dashboards, up to 100,000+ before things become clearly unusable on capable hardware with extracts. Treat these as rough signposts, not hard limits — the reliable approach is testing your specific dashboard against production-scale data and using Tableau's built-in Performance Recorder rather than trusting a fixed number from any single source.

## Can Tableau connect directly to a spreadsheet that updates automatically (like a live Google Sheet)?

Yes, via the Google Sheets connector, though be aware this behaves like any other live connection — every interaction with the dashboard queries the sheet, which can be slow for large sheets, and Google Sheets itself has practical row-count limits that make it a poor fit for large-scale data even before Tableau enters the picture. For anything beyond a small, frequently-edited reference sheet, a proper database or an extract refreshed on a schedule is usually the better long-term setup.

## Why does my map show pins in the wrong location, or not at all?

Usually a geographic role problem. Tableau needs to recognize a field as geographic (Country, State/Province, City, Zip Code, or actual Latitude/Longitude) to plot it — right-click the field → Geographic Role, and confirm it's assigned correctly. Ambiguous location names are a common specific cause (a city name that exists in multiple countries, or a state abbreviation Tableau doesn't recognize) — these often need to be manually matched via the "Edit Locations" dialog that appears when Tableau can't confidently resolve a location.

## Is it better to build calculated fields in Tableau or push the logic upstream into the database/ETL layer?

Generally, push logic upstream when it's reusable across multiple dashboards, computationally heavy, or something the source system should own as a single source of truth (e.g., a standard "Fiscal Quarter" definition used company-wide). Keep it in a Tableau calculated field when it's specific to one dashboard's presentation logic, exploratory, or needs to react dynamically to user-selected parameters (something upstream SQL can't do interactively). A practical middle ground many teams use: validate the logic in a Tableau calculated field first while iterating, then migrate it upstream once it's stable and reused across multiple workbooks.

## What actually happens when I "publish" a workbook vs. just sharing the `.twbx` file?

Sharing a `.twbx` (packaged workbook) file gives the recipient a self-contained snapshot — they need Tableau Desktop or the free Tableau Reader to open it, and it doesn't update unless you send a new file. Publishing to Tableau Server/Cloud puts the workbook on a central platform that others can view in a browser (no Tableau installation needed for viewers), supports scheduled data refreshes, permission management, and usage tracking — the standard approach for anything meant to be an ongoing, shared resource rather than a one-time export.
