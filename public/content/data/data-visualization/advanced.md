# Data Visualization — Advanced

## Rendering performance at real data scale

A scatter plot with a few hundred points renders instantly in any library — the same chart type with a few million points is a genuinely different engineering problem, and naively plotting all of it produces either a chart that takes minutes to render or one so overplotted (points stacked on top of each other) that it communicates nothing useful regardless of render time:

```python
# Naive — plots every point, slow and visually meaningless at scale
plt.scatter(df['x'], df['y'])   # fine for thousands, breaks down for millions

# Better — downsample intelligently, or use a density-aware representation
import datashader as ds
canvas = ds.Canvas(plot_width=800, plot_height=600)
agg = canvas.points(df, 'x', 'y')
img = ds.transfer_functions.shade(agg, cmap='viridis')
```
Datashader (and similar rendering-aggregation libraries) solve this by aggregating millions of points into a fixed-resolution pixel grid before rendering, rather than asking the renderer to individually draw each point — this is conceptually the same idea as a heatmap, but computed dynamically at whatever zoom level the viewer is at. For genuinely large datasets, the choice isn't "matplotlib vs. a faster library" — it's recognizing that naive point-per-point rendering is architecturally the wrong approach past a certain scale, and a density/aggregation-based rendering strategy is a different, necessary technique, not just an optimization.

## Statistical visualization: distributions beyond a simple histogram

A single histogram commits to one bin-width choice, which can meaningfully change the apparent shape of a distribution — too few bins hides real structure (bimodality), too many bins shows noise as if it were signal:

```python
import seaborn as sns

# A violin plot shows the full distribution shape, not just summary stats
sns.violinplot(data=df, x='category', y='value')

# A KDE (kernel density estimate) avoids bin-width sensitivity entirely
sns.kdeplot(data=df, x='value', hue='category', fill=True)
```
A box plot alone (median, quartiles, outliers) can look identical for two genuinely different underlying distributions — famously, Anscombe's quartet and the more recent "Datasaurus" dataset both demonstrate datasets with identical summary statistics but radically different actual shapes. A violin plot or KDE shows the actual distribution shape directly, catching bimodality, skew, or genuine outlier clusters that a box plot's five-number summary alone would hide — worth reaching for specifically when a distribution's actual shape, not just its central tendency, matters to the analysis.

## Building interactive dashboards with Plotly Dash or Streamlit

For interactivity beyond what a BI tool (Power BI, Tableau — covered in the Dashboarding content) provides, a code-based dashboard framework gives full control over interaction logic:

```python
# Streamlit — the fastest path from a script to an interactive web app
import streamlit as st
import pandas as pd

df = pd.read_csv('sales.csv')
region = st.selectbox('Region', df['region'].unique())
filtered = df[df['region'] == region]
st.plotly_chart(px.line(filtered, x='month', y='revenue'))
```
Streamlit trades some flexibility for genuine speed — a working interactive dashboard from a data analysis script in a few lines, appropriate for internal tools and rapid prototyping. Dash (also built on Plotly) offers more granular control over layout and callback logic, at the cost of more code, and is the better fit once a dashboard's interaction requirements genuinely exceed what Streamlit's simpler model handles cleanly — the choice between them, and between either and a BI tool, should be driven by how much custom interaction logic is actually needed versus how much of the interactivity is standard filter/drill-down behavior a BI tool already provides out of the box.

## Designing charts for a non-technical executive audience specifically

The chart design principles from earlier tabs (annotation, avoiding truncated axes, clear color encoding) matter most acutely for an executive audience, who will spend seconds, not minutes, with a chart before forming a conclusion:

- **Lead with the conclusion, not the data** — a chart title like "Revenue Grew 23% Following Q3 Launch" does more communicative work than a neutral title like "Monthly Revenue" for an audience that won't independently derive the conclusion themselves
- **One chart, one point** — an executive-facing chart trying to show three different insights at once (trend, breakdown by category, and a target comparison) usually communicates none of them clearly; three separate, focused charts each with one clear point outperform one crowded chart
- **Annotate the "why," not just the "what"** — a visible inflection point without an annotation explaining its cause leaves the viewer to guess; the annotation is what turns the chart into a complete communication rather than a prompt for a follow-up question

This is a genuinely different design target from an analyst-facing exploratory dashboard (which should support deep, flexible interaction) — designing one chart to serve both audiences well is a common mistake; a chart built for quick executive consumption and a chart built for analyst exploration are different artifacts with different design priorities, even when they're built from the same underlying data.
