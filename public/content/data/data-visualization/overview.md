# Data Visualization — Overview

**Before you start:** general familiarity with the concept of a chart (bar, line, pie) is assumed — no prior design or statistics background needed.

## Why This Exists (The Hook)

A table of 10,000 numbers and a well-chosen line chart can contain the exact same information, but only one of them lets a human spot a trend in two seconds. Data visualization exists because the human visual system is extraordinarily fast at perceiving position, length, and color patterns — and extraordinarily slow at scanning raw numbers for the same patterns. Choosing the right chart type (and avoiding a misleading one) is the difference between a stakeholder actually understanding the data and a stakeholder nodding along without really seeing it.

**Analogy** — Think of chart selection like choosing the right unit of measurement, not just decoration. You wouldn't measure a room's temperature in kilometers — the unit has to match what you're actually measuring. A pie chart "measures" part-of-whole relationships; a line chart "measures" change over time; a scatter plot "measures" correlation between two things. Using a pie chart to show a trend over 12 months is the visual equivalent of measuring temperature in kilometers — technically a number gets displayed, but it answers the wrong question.

**Try it (2 minutes)** — Reason through why "start the y-axis at zero for bar charts" is a hard rule, without looking anything up: a bar chart's core visual signal is bar *length* — a bar twice as tall reads as "twice as much." If the y-axis starts at, say, 90 instead of 0, and one bar is at 92 while another is at 96, that small 4-point difference would visually stretch to look enormous (the shorter bar might appear half the height of the taller one). What false impression does that create about the actual size of the difference, and why would a line chart (where the signal is the *slope*, not the *length* from a zero baseline) have a different rule?

## What is Data Visualization?

Data visualization is the graphical representation of information and data using charts, graphs, maps, and dashboards. The goal is to make complex data patterns immediately understandable.

**Why it matters for Data Analysts:**
- Raw data tables are impossible to interpret at scale
- Stakeholders need instant insight, not raw numbers
- Charts reveal trends, outliers, and correlations that SQL cannot

---

## Core Chart Types and When to Use Each

```conceptgrid
{
  "boxes": [
    { "title": "Bar / Column", "description": "Comparing categories -- avoid with more than 15 categories", "color": "blue" },
    { "title": "Line Chart", "description": "Trends over time -- avoid for non-continuous data", "color": "purple" },
    { "title": "Scatter Plot", "description": "Correlation between two variables -- avoid for categorical data", "color": "amber" },
    { "title": "Heatmap", "description": "Density/frequency patterns -- avoid for simple comparisons", "color": "green" }
  ]
}
```

| Chart Type | Best For | Avoid When |
|-----------|----------|-----------|
| **Bar / Column** | Comparing categories | Too many categories (>15) |
| **Line chart** | Trends over time | Non-continuous data |
| **Pie / Donut** | Part-of-whole (max 5 slices) | Too many segments |
| **Scatter plot** | Correlation between 2 variables | Categorical data |
| **Heatmap** | Density / frequency patterns | Simple comparisons |
| **Funnel** | Conversion stages | Non-sequential data |
| **Box plot** | Distribution + outliers | Non-technical audience |
| **Histogram** | Frequency distribution | Categorical data |
| **Treemap** | Hierarchical proportions | Deep hierarchies |
| **Waterfall** | Incremental changes | Totals only |

---

## The Grammar of Effective Visualizations

### 1. Choose the right encoding
- **Position** (x/y axis): Most accurate perception
- **Length**: Bar charts use this well
- **Color hue**: Use for categories (max 8 distinct colors)
- **Color saturation**: Use for continuous values (heatmaps)
- **Size**: Use carefully (area vs diameter confusion)
- **Shape**: Use for categorical differentiation

### 2. Reduce cognitive load
- Remove grid lines that don't add value
- Direct label instead of using legends when possible
- Use consistent color meaning (red = bad, green = good)
- Align numbers right, text left
- Start y-axis at zero for bar charts (never truncate)

### 3. Data-to-ink ratio (Edward Tufte)
Remove everything that doesn't encode information:
- No 3D charts (distorts perception)
- No decorative backgrounds
- No excessive borders
- No redundant labels

---

## Python Libraries for Visualization

```python
# Matplotlib — low-level, full control
import matplotlib.pyplot as plt
fig, ax = plt.subplots(figsize=(10, 6))
ax.bar(categories, values, color='steelblue')
ax.set_title('Monthly Revenue', fontsize=14, fontweight='bold')
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
plt.tight_layout()
plt.savefig('revenue.png', dpi=150)

# Seaborn — statistical visualization
import seaborn as sns
sns.heatmap(df.corr(), annot=True, cmap='coolwarm', fmt='.2f')

# Plotly — interactive charts
import plotly.express as px
fig = px.scatter(df, x='ad_spend', y='revenue', color='channel',
                 size='conversions', hover_data=['campaign'])
fig.show()

# Pandas built-in plotting
df.groupby('month')['revenue'].sum().plot(kind='bar', figsize=(12,5))
```

---

## Key Principles for Dashboard Design

1. **Answer ONE question per chart**
2. **Most important metric: top-left** (eye scans Z or F pattern)
3. **Use filters/slicers** for interactivity
4. **Refresh cadence**: Know if data is real-time, daily, weekly
5. **Color palette**: 2–3 brand colors, 1 accent for alerts
6. **Mobile-friendly**: Key metrics readable on 375px screen
