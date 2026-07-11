# Data Visualization — Fundamentals

## Choosing a chart type: starting from the question, not the data

The most common beginner mistake in data visualization isn't a design flaw — it's picking a chart type before being clear on the actual question being answered. The Overview tab's chart-type table is the reference; the practical habit is asking "what comparison or pattern does the audience need to see" first, then picking the chart that encodes exactly that:

```
"How did revenue change over the year?"        → Line chart (trend over time)
"Which product category sells the most?"        → Bar chart (comparing categories)
"Is there a relationship between ad spend
 and revenue?"                                   → Scatter plot (correlation)
"What fraction of revenue came from each
 region?" (with few regions)                     → Pie/donut chart
```
A chart chosen because it "looks good" rather than because it directly answers the actual question is a common, avoidable failure — a pie chart with 12 thin slices technically shows part-of-whole data, but a bar chart sorted by value communicates the same comparison far more clearly, since human perception is genuinely much better at comparing bar lengths than pie-slice angles.

## Your first chart, and the defaults worth immediately overriding

```python
import matplotlib.pyplot as plt

fig, ax = plt.subplots(figsize=(10, 6))
ax.bar(categories, values, color='steelblue')
ax.set_title('Monthly Revenue', fontsize=14, fontweight='bold')
ax.spines['top'].set_visible(False)      # remove non-data-encoding border
ax.spines['right'].set_visible(False)    # same — reduces visual clutter
plt.tight_layout()
plt.savefig('revenue.png', dpi=150)
```
Removing the top and right chart borders (`spines`) is a small but genuinely meaningful default override — those borders don't encode any information, and removing them is a direct, minimal example of Tufte's data-to-ink ratio principle from the Overview tab: every visual element should either encode data or be removed. This habit, applied consistently, is the difference between a chart that looks like a default library output and one that looks deliberately designed.

## The single most common way a chart misleads, even unintentionally

```python
# MISLEADING — a truncated y-axis makes a small difference look dramatic
ax.set_ylim(95, 100)   # bars for 96 vs 99 look ~4x different, not ~3% different

# HONEST — starting at zero shows the true proportional difference
ax.set_ylim(0, 100)    # the same 96 vs 99 difference now reads as genuinely small
```
Truncating a bar chart's y-axis is the single most common way a chart misleads an audience, and it's often unintentional — a tool's default auto-scaling can truncate the axis without the chart creator realizing the visual proportions no longer match the actual data proportions. This is specifically why bar charts should always start at zero (the Overview tab's rule) — a bar's *length* is the visual encoding being used, and length only reads correctly when the axis starts at zero; line charts, which encode trend via slope/position rather than bar length, are more forgiving of a non-zero baseline, which is a genuine, meaningful distinction rather than an inconsistent rule.

## Color: encoding meaning, not decoration

- **Categorical data** (distinct groups with no inherent order) → color hue, capped around 8 distinct colors — beyond that, colors become difficult to reliably distinguish
- **Continuous/sequential data** (a value that ranges low to high) → color saturation/intensity on a single hue (light-to-dark blue for a heatmap), not multiple unrelated hues, which would imply categories rather than a continuous scale
- **Diverging data** (values meaningfully above/below a midpoint — profit/loss, above/below target) → a diverging color scale (red-to-white-to-blue), where the midpoint color has real meaning

The rule worth internalizing above any specific palette choice: color should always be doing real encoding work — differentiating a category, showing intensity, or marking a meaningful threshold — never applied "to make it more colorful." A chart with color that carries no actual information adds visual noise the viewer has to mentally filter out, working against, not for, the goal of quick comprehension.

## Seaborn and Plotly: when to reach for them instead of raw matplotlib

```python
# Seaborn — for statistical visualization with less code than raw matplotlib
import seaborn as sns
sns.heatmap(df.corr(), annot=True, cmap='coolwarm', fmt='.2f')

# Plotly — for interactivity (hover tooltips, zoom, pan) that a static image can't provide
import plotly.express as px
fig = px.scatter(df, x='ad_spend', y='revenue', color='channel', size='conversions')
fig.show()
```
Matplotlib gives full low-level control but requires more code for common statistical patterns (a correlation heatmap, a distribution plot) — Seaborn builds on matplotlib specifically to make those common statistical charts a one-liner. Plotly's distinguishing value is genuine interactivity — hover tooltips, zoom, filtering — which matters specifically when the output is a web dashboard or an exploratory analysis tool someone will actually interact with, not when the output is a static image for a report or presentation, where matplotlib/Seaborn's simpler, more controllable static rendering is usually the better fit.
