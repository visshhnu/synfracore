# Data Visualization — Quick Reference

## Chart type selection, by question

| Question | Chart type |
|---|---|
| How did X change over time? | Line chart |
| How do categories compare? | Bar/column chart |
| What's the part-of-whole breakdown? (≤5 slices) | Pie/donut |
| Is there a relationship between two variables? | Scatter plot |
| What's the density/frequency pattern? | Heatmap |
| What's the distribution shape? | Histogram, violin plot, KDE |
| What are the conversion stages? | Funnel |
| What's the distribution + outliers? | Box plot |
| What's the hierarchical breakdown? | Treemap |
| What's the step-by-step incremental change? | Waterfall |

## Encoding priority (most to least perceptually accurate)

```
1. Position (x/y axis)   — most accurate
2. Length                — bar charts use this well
3. Color saturation      — good for continuous values
4. Color hue             — good for categories (max ~8 distinct)
5. Size                  — use carefully (area vs. diameter confusion)
6. Shape                 — categorical differentiation only
```

## Common mistakes checklist

```
[ ] Bar chart y-axis starts at zero (never truncated)
[ ] No 3D charts (distorts perception)
[ ] Color is doing real encoding work, not decoration
[ ] Colorblind-safe palette + redundant encoding (not color alone)
[ ] One clear question answered per chart
[ ] Annotation explains "why," not just "what"
[ ] Uncertainty shown (confidence intervals) where the data is genuinely uncertain
```

## Python libraries — when to use which

| Library | Best for |
|---|---|
| Matplotlib | Full low-level control, static images |
| Seaborn | Statistical charts (heatmaps, distributions) with less code |
| Plotly | Interactivity — hover, zoom, filter |
| Datashader | Rendering millions of points without overplotting |
| Streamlit | Fastest path from script to interactive web dashboard |

## Quick snippets

```python
# Colorblind-safe palette (Okabe-Ito)
colorblind_safe = ['#E69F00', '#56B4E9', '#009E73', '#F0E442',
                    '#0072B2', '#D55E00', '#CC79A7', '#000000']

# Small multiples
sns.FacetGrid(df, col='region', col_wrap=3).map(sns.lineplot, 'month', 'revenue')

# Confidence interval band
sns.lineplot(data=df, x='month', y='revenue', errorbar=('ci', 95))

# Overplotting fix — transparency
plt.scatter(df['x'], df['y'], alpha=0.3)

# Remove non-data-encoding chart borders
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
```

## Executive-audience chart checklist

```
[ ] Title states the conclusion, not just the topic
[ ] One chart = one point (not three insights crammed into one chart)
[ ] Key inflection points annotated with the "why"
[ ] Readable at a glance (3-second test) — not requiring explanation
```
