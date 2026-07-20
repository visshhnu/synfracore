# Excel & Advanced Excel — Portfolio Projects

Build these to demonstrate real skills, not to check a box. Each one is designed to be interview-worthy — something you can open on screen and walk through, explaining the decisions you made along the way.

## Project 1: Personal/Household Budget Tracker (Beginner)

**Level:** Beginner | **Time:** 1-2 days

**The scenario:** Track a full month of real (or realistic) income and expenses across categories (rent, groceries, transport, subscriptions, savings), and answer three questions from the data: where is the money actually going, which category is over its planned budget, and what would a 10% cut in the biggest discretionary category actually save per year.

### Steps

1. Build a raw `Transactions` sheet: date, description, category, amount — at least 60-80 realistic rows spanning a full month.
2. Use `SUMIF`/`SUMIFS` to total spend per category on a separate `Summary` sheet — don't manually add anything up.
3. Add a planned-vs-actual budget column per category, and a `IF`/conditional-formatting rule that flags any category over budget in red.
4. Build one PivotTable summarizing spend by category and week, and one chart (a bar chart by category is the right choice here — see the Overview tab's chart-selection guidance).
5. Add a `Data Validation` dropdown on the `Category` column so every future row can only use an existing category (prevents "Groceries" vs "groceries" vs "Grocery" fragmenting your totals).
6. Write a short one-page summary (on a `Notes` sheet, not a separate document) stating your three answers, with the actual formulas that produced them referenced by cell.

### Skills Demonstrated

- `SUMIF`/`SUMIFS`, conditional formatting, Data Validation
- PivotTables and basic chart selection
- Turning raw transactional data into an actual decision ("cut category X")

### File Naming

`excel-budget-tracker.xlsx` — keep the raw data, the summary, and your notes in separate sheets within the same file, not scattered across multiple files.

---

## Project 2: Sales Dashboard with Regional Drill-Down (Intermediate)

**Level:** Intermediate | **Time:** 3-4 days

**The scenario:** You're handed a year of raw sales data (date, region, product, salesperson, units, revenue — at least 500 rows, generate this with a formula-driven random dataset if you don't have a real one) and asked to build a one-page dashboard a regional manager can open and immediately understand: this month vs. last month, top 5 products by revenue, and which salesperson is trending down.

### Steps

1. Load the raw data into an actual Excel **Table** (`Ctrl+T`), not a plain range — this is what makes formulas and PivotTables auto-expand as you add rows later.
2. Build the month-over-month comparison using `XLOOKUP` (not `VLOOKUP` — this is the right project to actually use the modern function, matching the Intermediate tab's guidance) to pull each salesperson's current and prior month totals side by side.
3. Build a `Top 5 Products` block using `SORT`/`FILTER` (dynamic arrays) rather than manually sorting a static range — it should update automatically if the underlying data changes.
4. Add a PivotTable + PivotChart combination showing revenue by region, with a slicer for product category so a viewer can filter without touching a single formula.
5. Use conditional formatting (icon sets or data bars, not just cell fill color) to flag salespeople whose current-month revenue is below their trailing-3-month average — this requires a helper column with an `AVERAGEIFS` calculation, not just eyeballing it.
6. Put everything that matters on one `Dashboard` sheet — raw data and helper calculations live on separate hidden-or-secondary sheets. A dashboard a manager has to scroll sideways through multiple tabs to understand has failed its actual purpose.

### Skills Demonstrated

- Excel Tables, `XLOOKUP`, dynamic arrays (`SORT`/`FILTER`)
- PivotTables/PivotCharts with slicers
- Dashboard design: one screen, no scrolling, no formulas visible to the end viewer

### File Naming

`excel-sales-dashboard.xlsx`

---

## Project 3: VBA-Automated Monthly Report Capstone (Advanced)

**Level:** Advanced | **Time:** 1 week

**The scenario:** A monthly report currently takes someone 2 hours to assemble by hand every month: pull the latest raw export, clean it, recompute the same set of summary tables, apply the same conditional formatting, and email a summary. Automate the entire pipeline with VBA so it becomes a one-click operation.

### Steps

1. Start from Project 2's dashboard structure (or a fresh dataset of similar shape) — the goal here is automating the *process*, not building a new analysis from scratch.
2. Write a VBA macro (`Sub`) that imports a raw CSV export into the workbook, replacing the previous month's raw data — use `Workbooks.Open`, copy the range in, then close the source file, rather than requiring manual copy-paste.
3. Write a second macro that recalculates and reapplies your summary tables and conditional formatting rules to the newly-imported data — this is exactly the `FormatConditions.Add` pattern from the Advanced tab, applied to real data instead of a toy example.
4. Add error handling (`On Error GoTo`) for the realistic failure case: what happens if the CSV file is missing, or has a different column order than expected? The macro should fail with a clear message, not silently produce a wrong report.
5. Add a single button on the Dashboard sheet (Developer tab → Insert → Button, assigned to your master macro) that runs the entire pipeline in one click.
6. Document the actual time saved: time the manual process once, time the automated one, and record both — this is your strongest interview talking point for this project ("this took 2 hours manually, now it's 15 seconds and one click").

### Skills Demonstrated

- VBA: `Sub` procedures, file I/O, error handling, UI (buttons triggering macros)
- Process automation — the actual skill being tested, more than any single formula
- Quantifying impact (time saved) rather than just describing what was built

### File Naming

`excel-report-automation.xlsm` (note the `.xlsm` extension — required to save a workbook containing macros; a plain `.xlsx` silently strips VBA code on save)

---

## Tips for Great Excel Projects

**Use real or realistic data, at real volume.** A dashboard built on 10 rows doesn't prove anything — build with hundreds of rows so your formulas and PivotTables actually have to work, not just look right on a trivial dataset.

**Separate raw data, calculations, and presentation onto different sheets.** A workbook where formulas, helper columns, and the final dashboard are all jumbled on one sheet is hard for anyone else (including you, in six months) to follow.

**Be ready to explain a formula choice, not just that it works.** "Why `XLOOKUP` instead of `VLOOKUP` here" or "why a PivotTable instead of `SUMIFS` for this specific summary" are exactly the kind of questions an interviewer asks — have a real reason.

**Protect what shouldn't be edited.** Locking formula cells (`Format Cells → Protection`, then `Review → Protect Sheet`) on a dashboard meant for someone else to use is a small detail that signals you've actually handed a workbook to a real user before.

## Portfolio Checklist

- [ ] 3 workbooks covering beginner → intermediate → advanced, each solving a stated real problem
- [ ] At least one project uses a PivotTable + chart combination, not just static formulas
- [ ] At least one project uses `XLOOKUP` or dynamic arrays (`FILTER`/`SORT`/`UNIQUE`), not only legacy `VLOOKUP`
- [ ] The capstone project includes a working VBA macro, saved as `.xlsm`
- [ ] Every workbook separates raw data from calculations from the final presented view
- [ ] You can explain, out loud, why you made each major formula/design choice
