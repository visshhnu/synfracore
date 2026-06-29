# Dashboarding — Building End-to-End Data Dashboards

## What is a Dashboard?

A dashboard is a visual display of the most important information needed to achieve objectives, consolidated on a single screen. Unlike a report, a dashboard is:
- **Real-time or near-real-time** — refreshes automatically
- **Interactive** — users can filter, drill down, slice
- **Role-specific** — a CEO dashboard differs from a DevOps SRE dashboard

---

## Dashboard Types

| Type | Audience | Focus | Update Frequency |
|------|---------|-------|-----------------|
| **Operational** | Teams, managers | Day-to-day KPIs | Real-time / hourly |
| **Strategic** | C-suite, leadership | Business metrics | Daily / weekly |
| **Analytical** | Analysts, data scientists | Deep-dive exploration | On-demand |
| **Tactical** | Team leads | Progress against targets | Daily |

---

## End-to-End Dashboard Build Process

### Step 1: Define the Question
Before touching any tool, answer:
- Who is the user? What decision do they make?
- What is the ONE most important metric?
- What time window matters (today, this week, QTD, YTD)?
- What data source powers this?

### Step 2: Design the Layout (Wireframe)
```
┌─────────────┬─────────────┬─────────────┐
│ KPI: Revenue│ KPI: Users  │ KPI: Churn  │ ← Top row: headline metrics
├─────────────┴─────────────┴─────────────┤
│ Revenue Trend (Line Chart - 12 months)  │ ← Main chart
├────────────────────┬────────────────────┤
│ Top Products (Bar) │ Revenue by Region  │ ← Supporting charts
└────────────────────┴────────────────────┘
```

### Step 3: Build in Power BI
```
1. Get Data → Connect to SQL Server / CSV / SharePoint
2. Transform (Power Query):
   - Remove nulls
   - Parse dates
   - Create calculated columns
3. Create measures (DAX):
   Revenue YTD = TOTALYTD(SUM(Sales[Revenue]), Dates[Date])
   MoM Growth = DIVIDE([Revenue] - [Revenue LM], [Revenue LM])
4. Build visuals:
   - Card: Total Revenue
   - Line chart: Revenue over time with slicer for year
   - Bar: Top 10 products
   - Map: Revenue by state
5. Add slicers: Date range, Product category, Region
6. Publish to Power BI Service
7. Set refresh schedule (daily at 6am)
```

### Step 4: Build in Tableau
```
1. Connect to data source (live or extract)
2. Create calculated fields:
   Profit Ratio: SUM([Profit]) / SUM([Sales])
3. Build views:
   - Line chart: Sales over Order Date (continuous)
   - Bar: Sales by Sub-Category, colored by Profit Ratio
   - Map: Sales density by state
4. Create dashboard:
   - Drag sheets to canvas
   - Add filters (global vs. local)
   - Add actions (clicking bar filters map)
5. Publish to Tableau Public/Server
```

---

## Portfolio Project: Sales Performance Dashboard

**Dataset**: Superstore dataset (free from Tableau sample data)

**Build this**:
1. **Executive KPI Card**: Total Revenue, Total Profit, Profit Ratio, YoY Growth
2. **Trend Line**: Monthly Revenue vs. Prior Year (with forecast)
3. **Product Performance**: Top 20 Sub-Categories by Profit (sorted bar)
4. **Geographic View**: Sales map by state (filled map)
5. **Segment Drill-down**: Consumer vs. Corporate vs. Home Office
6. **Filters**: Date range picker, Region, Segment, Category

**DAX measures needed:**
```dax
Total Revenue = SUM(Orders[Sales])
Total Profit = SUM(Orders[Profit])
Profit Ratio = DIVIDE([Total Profit], [Total Revenue])
Revenue LY = CALCULATE([Total Revenue], SAMEPERIODLASTYEAR(Dates[Date]))
YoY Growth % = DIVIDE([Total Revenue] - [Revenue LY], [Revenue LY])
```

---

## Common Mistakes to Avoid

1. **Too many KPIs** — Pick top 5 max for the hero row
2. **No mobile layout** — Power BI and Tableau both have mobile view
3. **Static data** — Always wire to a live source or schedule refresh
4. **No context** — Show comparison (vs. last period, vs. target)
5. **Colors without meaning** — Don't use color just for decoration
