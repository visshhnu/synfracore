# Tableau — Prerequisites

## What You Need Before Starting

Tableau is more forgiving to start cold than something like shell scripting — it's a drag-and-drop tool, not a programming language — but a few things will make the difference between "clicking around" and actually building useful dashboards from the start.

### 1. Basic spreadsheet/data literacy (required)

You should already be comfortable with:
- Reading a table of data and understanding rows vs. columns, and what a "field" is
- Basic Excel or Google Sheets usage — sorting, filtering, simple formulas (`SUM`, `AVERAGE`, `IF`)
- Understanding what a "unique identifier" is in a dataset (e.g., why Customer ID matters more than Customer Name for joins/grouping)

If you've never worked with tabular data at all, spend a little time in a spreadsheet first — Tableau's whole mental model (dimensions, measures, aggregation) maps directly onto ideas you already half-know from spreadsheets, just with better visualization tooling.

### 2. A dataset to practice on (required)

Reading about Tableau without a real dataset to click through won't build the intuition you need. Reasonable starting points, easiest first:
- **Tableau's own Sample - Superstore dataset** — ships built into Tableau Desktop and Public, and is what almost every official tutorial and most of this course's examples (`[Sales]`, `[Profit]`, `[Order Date]`, `[Customer ID]`) are built around
- **Tableau Public Gallery** (public.tableau.com) — browse other people's published workbooks and download the underlying data to explore how a finished dashboard was built
- **Kaggle** or **data.gov** — real-world datasets in your area of interest, once you're past the absolute basics and want practice with messier, less pre-cleaned data

### 3. Tableau Desktop or Tableau Public installed (required)

- **Tableau Public** (free) is the right starting point for learning — full authoring functionality, the only limitation is that saved work is public (anyone can view/download it), which is a fine tradeoff while you're learning and building a portfolio anyway
- **Tableau Desktop** (paid, or free via an active student/educator license if you qualify) is only needed once you're working with private/proprietary data or need to save work privately
- Either way, install before starting the Fundamentals section — this is a hands-on tool, and reading about shelves and marks without an actual canvas to drag them onto won't build real fluency

### 4. Basic SQL concepts (recommended, not required to start)

You don't need to write SQL to use Tableau — that's much of the point of the tool. But understanding a few underlying concepts will make some intermediate/advanced topics click faster instead of feeling arbitrary:
- What a JOIN is (this maps directly onto how Tableau lets you combine multiple tables)
- What GROUP BY / aggregation means conceptually (this is exactly what dragging a measure onto a shelf is doing under the hood)
- What a database "view" is (relevant once you're deciding whether to push calculation logic upstream vs. keep it in Tableau — see this course's FAQ section)

If you already know SQL, several intermediate concepts (custom SQL connections, understanding why query performance matters) will feel immediately familiar rather than new.

### 5. What you do *not* need yet

- Programming experience of any kind — Tableau's calculated-field language (similar to Excel formulas) is the closest thing to "code" you'll touch, and it's covered from scratch in the Fundamentals/Intermediate sections
- Statistics or data science background — helpful eventually for advanced analytics features (trend lines, forecasting, clustering), but not needed to build genuinely useful dashboards
- Any specific industry domain knowledge — the Sample - Superstore dataset and most learning material use generic retail/sales data specifically so no prior domain expertise is assumed

### Quick self-check

Open Tableau (Public or Desktop), connect to the built-in Sample - Superstore dataset, and try to answer this without looking anything up: "Which product category had the highest total profit last year?" If you can drag the right fields onto Rows/Columns and get an answer within a couple of minutes, you're ready for the Fundamentals section. If the Data pane itself (the list of fields on the left) feels confusing, spend a bit more time on prerequisite #1 first.
