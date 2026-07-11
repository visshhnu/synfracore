# Data Visualization — Notes

## Core mental model

- Pick the chart type from the actual question being answered, not from what data happens to be available or what "looks good."
- Data-to-ink ratio (Tufte): every visual element should either encode information or be removed — grid lines, borders, 3D effects, decorative backgrounds all cost attention without adding meaning.
- The "3-second test": if a viewer glancing briefly would come away with a different takeaway than the actual data supports, the chart needs a design fix even if the underlying numbers are correct.

## Encoding and color

- Position and length are the most perceptually accurate encodings; size and shape are the least reliable — pick encodings in that rough priority order.
- Color must always do real encoding work (category, intensity, threshold) — never applied purely for decoration.
- Colorblind-safe palettes matter for a real, non-trivial fraction of any audience (~1 in 12 men) — redundant encoding (pairing color with line style, labels, or shape) is the more robust fix than palette choice alone.

## The most common way a chart misleads, even unintentionally

- Truncated bar-chart y-axis is the single most common unintentional distortion — bars encode via length, and length only reads correctly starting from zero. Line charts (encoding via slope/position) are more forgiving of a non-zero baseline.
- A box plot alone can look identical for genuinely different underlying distributions (Anscombe's quartet / Datasaurus) — a violin plot or KDE shows actual shape when that matters.
- Uncertain data (forecasts, survey estimates) shown as a single confident line overstates precision — confidence interval bands communicate real precision instead.

## Scale and performance

- Naive point-per-point rendering (matplotlib scatter) breaks down — both visually (overplotting) and performance-wise — well before millions of points; density-aggregation rendering (Datashader) is a different, necessary technique past that scale, not just an optimization.
- Always test chart/dashboard performance against production-representative data volume during development, not a small local sample — this is the most common cause of "works locally, unusable in production."

## Interactivity — matching investment to actual use case

- Interactivity (hover, zoom, filter) genuinely benefits exploratory analysis tools where a viewer investigates specific points/outliers.
- It adds little value for a static report/slide chart meant to communicate one conclusion — a well-annotated static image often communicates the point more directly than an interactive chart a reader may never actually interact with.
- Streamlit trades flexibility for speed (fastest path from script to interactive app); Dash gives more control at more code cost; a BI tool (Power BI/Tableau) is usually the right choice when the interactivity needed is standard filter/drill-down, not custom logic.

## Designing for different audiences

- Executive-facing charts: lead with the conclusion in the title, one point per chart, annotate the "why" not just the "what" — designed for seconds of attention, not minutes.
- Analyst-facing dashboards: designed for deep, flexible interaction and exploration.
- These are different design targets even from the same underlying data — building one chart to serve both audiences well is a common mistake.
