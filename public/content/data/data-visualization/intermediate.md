# Data Visualization — Intermediate

## Colorblind-safe palettes: a real accessibility requirement, not an edge case

Roughly 1 in 12 men and 1 in 200 women have some form of color vision deficiency, most commonly red-green — a chart relying on red-vs-green to convey meaning (the extremely common "red = bad, green = good" convention) is genuinely unreadable to a meaningful fraction of any real audience, not a rare edge case to deprioritize:

```python
# Colorblind-safe qualitative palette (Okabe-Ito) — distinguishable
# across the common forms of color vision deficiency
colorblind_safe = ['#E69F00', '#56B4E9', '#009E73', '#F0E442',
                    '#0072B2', '#D55E00', '#CC79A7', '#000000']

import seaborn as sns
sns.set_palette(colorblind_safe)
```
Beyond palette choice, the more robust fix is **redundant encoding** — pairing color with a second, independent visual signal (a different line style, a direct data label, distinct marker shapes) so the chart remains readable even if the color distinction itself is lost, whether from color vision deficiency, a black-and-white printout, or a low-quality screen. A chart that only works correctly for viewers with typical color vision is a chart with a real, avoidable accessibility gap.

## Small multiples: showing many comparisons without one overloaded chart

When a single chart is being asked to show too many dimensions at once (an over-plotted scatter with a dozen colors and shapes, all overlapping), **small multiples** — the same simple chart repeated across a grid, one per category — is often the clearer solution:

```python
import seaborn as sns
g = sns.FacetGrid(df, col='region', col_wrap=3, height=3)
g.map(sns.lineplot, 'month', 'revenue')
```
This is Tufte's small-multiples principle in practice: rather than cramming 6 regions' trend lines into one chart with 6 competing colors (genuinely hard to individually trace), showing 6 small, identical, simple line charts side by side lets the viewer compare shape and pattern across panels almost as easily as scanning text — trading one complex chart for several simple ones is very often the right tradeoff once a single chart's dimensionality starts genuinely overwhelming a viewer.

## Annotation: turning a chart into an argument, not just a picture

A chart without annotation shows data; a chart with deliberate annotation makes a specific point — the difference between "here is the data" and "here is what happened and why it matters":

```python
fig, ax = plt.subplots()
ax.plot(dates, revenue)
ax.annotate('Product launch', xy=(launch_date, revenue_at_launch),
            xytext=(10, 20), textcoords='offset points',
            arrowprops=dict(arrowstyle='->'))
ax.axhline(y=target, color='red', linestyle='--', label='Target')
```
Annotating a specific inflection point (a launch date, an incident, a policy change) directly on the chart — rather than leaving the viewer to notice a pattern and separately look up what caused it — is what turns a chart from something a viewer has to interpret into something that communicates its own conclusion. This matters most for charts intended for an audience without deep familiarity with the underlying data (an executive summary, a public report) where the chart itself needs to carry the explanation, not just the shape.

## Visualizing uncertainty: not every value is a single, certain point

```python
import seaborn as sns
sns.lineplot(data=df, x='month', y='revenue', errorbar=('ci', 95))
# Shades a 95% confidence interval band around the line automatically
```
A single line implies a value known with certainty — for a forecast, a survey result, or any statistically-derived estimate, that's actively misleading if the underlying uncertainty is real and meaningful. Showing a confidence interval band (or error bars on a bar chart) alongside the point estimate communicates the actual precision of the data, not an overstated false precision — a forecast chart showing only a single confident line, with no indication that the further-out predictions are meaningfully less certain than the near-term ones, is a common and genuinely misleading simplification worth actively avoiding for any genuinely uncertain data.

## Interactive charts: what genuinely benefits from interactivity, and what doesn't

```python
import plotly.express as px
fig = px.scatter(df, x='ad_spend', y='revenue', color='channel',
                  size='conversions', hover_data=['campaign_name', 'date'])
fig.show()
```
Interactivity (hover tooltips, zoom, filter, drill-down) genuinely adds value for **exploratory analysis** — a scatter plot with hundreds of overlapping points is far more useful when hovering reveals each point's specific details, letting a viewer investigate an outlier directly rather than guessing at it from position alone. It adds meaningfully less value for a chart intended to make one specific point in a static report or slide deck, where a well-annotated static image communicates the intended conclusion more directly than an interactive chart a reader might never actually interact with. Matching interactivity investment to actual use case — exploratory tool versus one-conclusion static chart — avoids over-engineering a chart that will only ever be viewed once, briefly, in a PDF.
