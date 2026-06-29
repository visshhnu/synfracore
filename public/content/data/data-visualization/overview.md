# Data Visualization — Overview

## What is Data Visualization?

Data visualization is the graphical representation of information and data using charts, graphs, maps, and dashboards. The goal is to make complex data patterns immediately understandable.

**Why it matters for Data Analysts:**
- Raw data tables are impossible to interpret at scale
- Stakeholders need instant insight, not raw numbers
- Charts reveal trends, outliers, and correlations that SQL cannot

---

## Core Chart Types and When to Use Each

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
