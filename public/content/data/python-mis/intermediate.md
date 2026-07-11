# Python for MIS — Intermediate

## Pandas: the library that makes Python feel like Excel, done programmatically

```python
import pandas as pd

df = pd.read_excel("monthly_sales.xlsx")

# Filtering — the pandas equivalent of an Excel AutoFilter
high_value = df[df["amount"] > 10000]

# Grouping and summing — the equivalent of a Pivot Table
by_region = df.groupby("region")["amount"].sum()

# A new calculated column — the equivalent of dragging a formula down every row
df["amount_with_tax"] = df["amount"] * 1.18
```
Every one of these has a direct, familiar Excel equivalent — this mapping is the fastest path from "knows Excel" to "productive in pandas," worth leaning on explicitly rather than learning pandas as if it were an entirely unfamiliar tool.

## Merging data from multiple files — the actual automation payoff

```python
# Read every team's file and combine them into one DataFrame
import glob

files = glob.glob("team_reports/*.xlsx")
combined = pd.concat([pd.read_excel(f) for f in files], ignore_index=True)
```
This single operation is what replaces the manual "open 10 files, copy each team's data into one master sheet" process — the actual, concrete task that automation eliminates, not an abstract productivity claim. Once written correctly, this same code handles 10 files or 100 with no additional manual effort.

## Cleaning messy real-world data

```python
df["region"] = df["region"].str.strip().str.title()   # "  north " -> "North"
df = df.dropna(subset=["amount"])                       # remove rows missing a required value
df["amount"] = pd.to_numeric(df["amount"], errors="coerce")   # force numeric, invalid values become NaN
```
Real spreadsheet data — especially collected from multiple people's independently-maintained files — is reliably messier than a clean example dataset: inconsistent capitalization, stray whitespace, occasional non-numeric values in a numeric column. Building a genuine cleaning step into your script, rather than assuming input data is already clean, is what makes automation actually reliable against real monthly submissions instead of just the one sample file you tested with.

## Pivot tables in pandas: the direct equivalent

```python
pivot = df.pivot_table(
    values="amount",
    index="region",
    columns="month",
    aggfunc="sum",
    fill_value=0,
)
```
This produces exactly what an Excel Pivot Table would — regions as rows, months as columns, summed amounts in each cell — but as reproducible code rather than a manually-configured, easy-to-accidentally-break UI object. The real advantage at scale: this exact pivot recomputes correctly and identically every time the script runs against new data, with zero risk of someone accidentally dragging a field to the wrong pivot area.

## Writing a formatted Excel report, not just raw data

```python
with pd.ExcelWriter("report.xlsx", engine="openpyxl") as writer:
    pivot.to_excel(writer, sheet_name="Summary")
    workbook = writer.book
    worksheet = writer.sheets["Summary"]
    worksheet.column_dimensions["A"].width = 20   # basic formatting, still worth doing
```
A raw data dump technically satisfies "generate a report" but isn't genuinely usable by a non-technical recipient — basic formatting (column widths, sheet naming, maybe conditional formatting for highlighting outliers) is what makes an automated report actually presentable enough to send directly to a manager, rather than something that still needs manual polish before anyone else sees it.

## Error handling for a script that runs unattended

```python
import logging

logging.basicConfig(filename="report_log.txt", level=logging.INFO)

try:
    combined = pd.concat([pd.read_excel(f) for f in files], ignore_index=True)
except Exception as e:
    logging.error(f"Failed to combine files: {e}")
    raise
```
A script that runs unattended on a schedule needs to log what happened, since nobody's watching it execute in real time — if it fails silently with no log output, the first sign of a problem is a manager asking "where's this week's report," well after the fact. Logging both successful runs and failures, even minimally, is what makes an unattended automated script actually trustworthy rather than a black box you have to manually verify every time.
