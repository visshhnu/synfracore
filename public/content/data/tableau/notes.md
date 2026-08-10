# Tableau — Revision Notes

Condensed reference for quick review. Consolidated from this course's interview and certification material, de-duplicated, and corrected where the source files disagreed or were out of date.

---

## Core Concepts

```
TABLEAU: Visual analytics / BI platform. Drag-and-drop. VizQL generates
         the underlying query automatically as you build.

Dimensions:  categorical data — Region, Category, Customer Name, Order Date
Measures:    numeric data — Sales, Profit, Quantity

Color rule (corrected — this is the actual rule, not "blue=dim, green=measure"):
  BLUE  = discrete    (usually dimensions, but a discrete measure is blue too)
  GREEN = continuous  (usually measures, but a continuous date is green too)
  Most dimensions default to discrete/blue and most measures default to
  continuous/green — which is why the simplified version mostly works —
  but either can be converted via right-click on the pill.
```

## Products

```
Tableau Desktop:  full authoring, Windows/Mac (paid, or free via Public)
Tableau Server:   on-premise sharing/publishing, IT-managed
Tableau Cloud:    SaaS version of Server (formerly "Tableau Online")
Tableau Public:   free, full authoring, all work is public
Tableau Prep:     data cleaning/transformation pipeline (ETL)
Tableau Reader:   free, view-only for packaged workbooks
```

## Building Blocks

```
Workbook (.twbx)  → everything: data + worksheets + dashboards, packaged
Worksheet          → a single visualization
Dashboard           → multiple worksheets + filters + text, combined
Story               → a sequence of dashboards telling a narrative

Shelves:
  Rows / Columns  → axes or table structure
  Color / Size / Label / Detail / Tooltip / Shape → mark encodings
  Filter          → restricts what's shown
```

## Calculated Fields — Syntax Reference

```
-- Basic
[Sales] - [Cost]
SUM([Profit]) / SUM([Sales])              -- profit margin (aggregate both sides)

-- Conditional
IF [Sales] > 10000 THEN "High"
ELSEIF [Sales] > 5000 THEN "Medium"
ELSE "Low" END

IIF([Profit] > 0, "Profitable", "Loss")    -- fine for simple binary logic;
                                             -- prefer IF/ELSEIF for 3+ branches

CASE [Region]
    WHEN "North" THEN "Northern"
    ELSE "Other"
END

-- String functions
UPPER([Name]) | LOWER([Name]) | TRIM([Email])
LEFT([Order ID], 6) | CONTAINS([Notes], "urgent") | SPLIT([Full Name], " ", 1)

-- Date functions
YEAR([Order Date]) | DATEDIFF('day', [Order Date], [Ship Date])
DATETRUNC('month', [Order Date])           -- first day of that month
TODAY() - [Order Date]

-- Table calculations (compute across rows already IN the view)
RUNNING_SUM(SUM([Sales]))
WINDOW_AVG(SUM([Sales]))
RANK(SUM([Sales]))
LOOKUP(SUM([Sales]), -1)                   -- prior row's value, used for
                                             -- period-over-period % change
```

## LOD Expressions — The Feature Most Worth Mastering

```
{ FIXED [dim] : agg }     compute at this exact granularity, ignoring the
                           view's dimension filters entirely (context/data
                           source filters still apply — they run BEFORE
                           FIXED expressions ever see the data)

{ INCLUDE [dim] : agg }   add MORE detail than the current view
                           → use to compute something more granular than
                             what's displayed, e.g. avg order value per
                             customer when the view is at region level

{ EXCLUDE [dim] : agg }   remove detail from the current view
                           → use for "annual total shown on every monthly
                             row" style calculations

Common patterns:
  % of total:        SUM([Sales]) / { FIXED : SUM([Sales]) }
  Cohort analysis:    { FIXED [Customer ID] : MIN([Order Date]) }
  Avg order value
   (line-item data):  { FIXED [Cust ID]:SUM([Sales]) } / { FIXED [Cust ID]:COUNTD([Order ID]) }
                       (NOT plain COUNT — that counts line items, not orders)

FIXED vs. Table Calc — the actual decision rule:
  Meaning should NOT change when the view's layout changes → LOD expression
  Meaning SHOULD depend on what's currently in the view    → table calculation
```

## Filters — Order of Operations (inner to outer)

```
Extract filter → Data Source filter → Context filter →
Dimension filter → Measure filter → Table Calc filter

Context filter: creates a temporary filtered table; every filter after it
                applies to that smaller table instead of the full dataset.
                Use for: Top N within an already-filtered set, and for
                speeding up dashboards with several stacked filters.
```

## Performance

```
Extracts (.hyper) vs. Live connection:
  Extract → snapshot, much faster, only as fresh as last refresh
  Live    → always current, but every interaction queries the DB directly

Marks threshold — NOTE: sources disagree, there's no single hard number.
  Different course material and vendor guidance cites anywhere from
  ~5,000 marks (conservative, "start being careful" threshold for
  interactive dashboards) up to 100,000+ (before things become clearly
  unusable on capable hardware with extracts). Test against YOUR actual
  production data volume with the Performance Recorder rather than
  trusting a fixed number from any one source.

Other levers, roughly in order of impact:
  1. Aggregate/filter at the source (database view, not raw table)
  2. Use extracts instead of live for anything that can tolerate staleness
  3. Avoid high-cardinality dimensions on Color/Shape/Label
  4. Context filters to shrink the dataset before subsequent filters run
  5. FIXED LOD > table calculations > row-level calculations, for calc cost
  6. Limit dashboard to ~8-12 visualizations (design AND performance reasons)
```

## Dashboard Actions

```
Filter action:     click a mark → filters other sheets
Highlight action:  click a mark → highlights the same value elsewhere
URL action:        click a mark → opens an external link
Parameter action:  click a mark → sets a parameter value (pairs with
                   calculated fields for dynamic, click-driven views)
```

## Tableau vs. Power BI (common interview framing)

```
              Tableau                      Power BI
Vendor        Salesforce                   Microsoft
Pricing       Higher, per-user              Lower, Microsoft-ecosystem bundled
Viz engine    Industry-leading, highly       Strong, many pre-built visuals
              customizable
Connectors    200+ native                    Strong Microsoft-ecosystem depth
Calc language Tableau Calculations           DAX (stronger time intelligence)
Best fit      Analyst-heavy teams,           Microsoft-shop orgs,
              complex/custom viz             self-service BI
```

## Certifications (corrected — see PYQ file for full verification note)

```
Tableau Desktop Specialist    — $100  | entry-level, never expires
Tableau Certified Data Analyst — $250 | 2-year validity, includes hands-on labs
Tableau Server Certified Associate — ~$250 | Server admin focus

NOTE: "Tableau Desktop Certified Associate" (previously listed in this
course's own certification.md at $500) was RETIRED in 2021, along with
the old Certified Professional tiers. Don't study for or reference it
as a current credential.

ShellCheck-equivalent for this domain: there's no single de-facto linter,
but Tableau's built-in Performance Recorder (Tools → Record Performance)
is the closest equivalent for catching problems before they ship.
```

## Debugging / Troubleshooting Checklist

```
Wrong number showing?        → check for a FIXED LOD ignoring a filter
                                you expected it to respect
Filter not affecting a sheet? → check it's set to apply to the right
                                data source / worksheets
Slow dashboard?               → check extract vs. live, mark count,
                                and where aggregation is happening
Map pins missing/wrong?       → check the field's Geographic Role
Aggregate/non-aggregate error? → aggregate both sides of the calculation,
                                or use an LOD expression if you genuinely
                                need to mix granularities
```
