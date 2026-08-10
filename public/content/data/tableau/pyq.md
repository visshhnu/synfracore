# Tableau — PYQ (Previously Asked / Practice Questions)

**Framing note:** Unlike GATE/JEE/banking exams elsewhere on this platform, Tableau's certification exams (administered by Salesforce/Tableau via Pearson VUE) are proctored and confidential — there's no public past-paper archive to draw from. What follows are practice questions built directly from the **published exam guide domains** for the two certifications that actually test this material — **Tableau Desktop Specialist** (verified current price: $100, 45 questions, 60 minutes, no expiry) and **Tableau Certified Data Analyst** (verified current price: $250, 40-45 MCQ/multi-select plus 8-10 hands-on lab items, 120 minutes, 2-year validity) — rather than invented "leaked" questions.

**Correction to this course's own existing certification material:** `certification.md` and `fundamentals.md` both list outdated pricing ($250 for Desktop Specialist, and reference "Tableau Desktop Certified Associate" as a current credential). That associate-tier exam and the old Certified Professional tiers were retired in 2021. The corrected current ladder is: Desktop Specialist ($100, never expires) → Certified Data Analyst ($250, 2-year validity) → Server Certified Associate (~$250) → Tableau Certified Consultant (professional tier). Worth updating in the source files.

---

### 1. (Desktop Specialist domain: Connect to Data) You have a live connection to a database and an extract of the same data. What's the key tradeoff?

**Answer:** A live connection queries the underlying database on every interaction — always current, but performance depends entirely on the database and network. An extract (`.hyper` format) is a snapshot stored in Tableau's own fast columnar format — queries against it are typically much faster, but the data is only as fresh as the last extract refresh. The general rule: use extracts for dashboards where performance matters and near-real-time data isn't essential; use live connections when the data must be current to the second (e.g., operational monitoring) and you can tolerate the latency.

---

### 2. (Desktop Specialist domain: Chart Building) A stakeholder wants to compare sales across 4 regions. Which chart type is the better default choice, and why — bar chart or pie chart?

**Answer:** Bar chart. Pie charts are hard for people to compare accurately once there are more than 2-3 slices, because human perception is much better at judging the length of bars along a common baseline than at judging the angle/area of pie slices. This course's own Overview material caps recommended pie/donut use at "max 5 categories" for exactly this reason — 4 regions is right at that edge, and a bar chart removes the ambiguity entirely.

---

### 3. (Certified Data Analyst domain: LOD Expressions) Write a calculated field that shows each customer's total sales as a percentage of the grand total, regardless of any dimension filters applied to the view.

```
SUM([Sales]) / { FIXED : SUM([Sales]) }
```
**Why this is the right pattern:** `{ FIXED : SUM([Sales]) }` with no dimension specified computes the grand total across the entire dataset, ignoring view filters (though not data source or context filters — those apply before FIXED expressions even see the data). Dividing the view-level `SUM([Sales])` by that constant grand total gives a true "% of total" that doesn't shift depending on what a user has filtered.

---

### 4. (Certified Data Analyst domain: LOD Expressions) A dataset has one row per order line item. Write a calculated field for each customer's average order value (total spent divided by number of distinct orders, not number of line items).

```
{ FIXED [Customer ID] : SUM([Sales]) } / { FIXED [Customer ID] : COUNTD([Order ID]) }
```
**What's being tested:** recognizing that "number of orders" is not the same as "number of rows" when the data is at line-item granularity — a very common real mistake is dividing by `COUNT()` (row count) instead of `COUNTD([Order ID])` (distinct order count), which silently inflates the denominator whenever an order has more than one line item.

---

### 5. (Desktop Specialist domain: Filters) What's the practical difference between a Context filter and a regular Dimension filter, and when would you reach for a Context filter specifically?

**Answer:** Regular filters (dimension, measure, table calc) all execute independently against the same underlying data. A context filter runs first and creates a temporary, filtered dataset that all subsequent filters then apply to. Two reasons to use one: (1) performance — subsequent filters now scan a smaller dataset, which can meaningfully speed up dashboards with several filters; (2) correctness for "Top N within a filtered set" — e.g., "Top 5 products within the West region" only works correctly if the region filter is set as context so the Top-N filter evaluates against the already-region-filtered data, rather than against the full dataset.

---

### 6. (Certified Data Analyst domain: Table Calculations) Write a calculated field that shows each month's sales as a percent change from the prior month.

```
(SUM([Sales]) - LOOKUP(SUM([Sales]), -1)) / ABS(LOOKUP(SUM([Sales]), -1))
```
**Note on this one:** this exact formula already appears in this course's Overview material as a "year over year growth" example — it's identical for month-over-month, just applied with the date field at month granularity instead of year. Worth knowing this is the same pattern reused at different date granularities, rather than a separate formula to memorize per time period. The `ABS()` around the denominator matters: without it, a swing from a negative sales/profit figure to a positive one (or vice versa) can produce a nonsensical or sign-flipped percentage.

---

### 7. (Desktop Specialist domain: Data Prep) You import a CSV where a "Sales Date" column was read in as a text/string field instead of a date field. What's the fix, and why does it matter beyond just formatting?

**Answer:** Change the field's data type via the field's icon in the Data pane (or right-click → Change Data Type → Date), or fix it upstream in Tableau Prep / the data source. This matters beyond cosmetics because date-specific functions (`DATEDIFF`, `DATETRUNC`, `YEAR()`, date hierarchies for drilling from Year → Quarter → Month) only work correctly on a true date field — treated as a string, "Sales Date" would sort and filter alphabetically rather than chronologically, and none of Tableau's date intelligence features would be available on it.

---

### 8. (Certified Data Analyst domain: LOD Expressions) A view is at Region-and-Month granularity. Write a calculated field for the annual total, shown on every monthly row (so a user can see "this month vs. the year's total" side by side).

```
{ EXCLUDE [Month] : SUM([Sales]) }
```
**What's being tested:** recognizing `EXCLUDE` as the right tool here rather than `FIXED`. `EXCLUDE [Month]` takes the view's current granularity (Region + Month) and removes just `Month` from the calculation, leaving Region-level annual totals that still respect any Region filtering already applied to the view — which is usually the actually-intended behavior, versus `FIXED [Region]`, which would also ignore any Region filter the user applies.

---

### 9. (Desktop Specialist domain: Dashboard Design) A dashboard has 15 different worksheets crammed onto one screen. A stakeholder says it "feels slow and overwhelming." What are the two separate problems being described, and how does each get fixed?

**Answer:** These are two distinct issues that happen to show up together. **"Overwhelming"** is a design problem — too many visualizations competing for attention with no clear visual hierarchy; the fix is reducing scope (this course's own Advanced material recommends roughly 8-12 visualizations per dashboard as a practical ceiling) and using layout containers to establish clear grouping and priority. **"Slow"** is a performance problem — each additional worksheet is a separate query (or set of marks to render); the fix is the standard performance toolkit (extracts over live connections, reducing mark count, pre-aggregating data), and is not fixed by better visual design alone. A dashboard can be visually clean and still slow, or visually cluttered and still fast — treating them as the same problem leads to fixing the wrong one.

---

### 10. (Certified Data Analyst domain: Calculations) What's the difference between `IF/ELSEIF/ELSE/END` and `IIF()`, and when does the choice actually matter beyond style preference?

**Answer:** They're functionally similar for simple binary or short branching logic — `IIF([Profit] > 0, "Profitable", "Loss")` and the equivalent `IF/ELSE/END` produce the same result. The practical difference shows up with more than 2-3 branches: `IF/ELSEIF/ELSE/END` reads far more clearly with many conditions, while nesting multiple `IIF()` calls inside each other to express the same logic becomes hard to read and debug. This course's own Advanced material specifically calls out "avoid nested IF statements with many conditions" as a performance/maintainability concern — the same caution applies at least as strongly to nested `IIF()`.
