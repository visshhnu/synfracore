# Python for MIS — Fundamentals

## Why Python? The Honest Case for MIS Professionals

**Before you start: you already have the hardest skill.** You understand the data. You know what numbers matter to management, which teams send wrong formats, which KPIs are calculated which way, what exceptions exist. A fresh Python programmer knows none of that — you do. Python is just the tool that lets you act on that knowledge in seconds instead of hours.

| Current — Excel manual | Future — Python automated |
|---|---|
| Open 8 region files, copy-paste into master — 2 hours | Python reads all 8 files, merges — 3 seconds |
| VLOOKUP breaks when someone adds a row above | `pd.merge()` never breaks regardless of row order |
| Rebuild the pivot table every Monday | `groupby()` recalculates automatically on new data |
| Email the report manually with an attachment | Python emails the report automatically at 8am Monday |
| Formula shows a wrong result — 30 min debugging | Python's error message tells you exactly what's wrong |

## Setup — Python Running in 15 Minutes

**Step 1 — Install Python:** go to `python.org/downloads`, click Download Python 3.11, run the installer, and **check the box "Add Python to PATH"** — this is critical, don't miss it — then click Install Now.

**Step 2 — Verify it worked:** press Windows + R, type `cmd`, press Enter, then type `python --version` — it should show `Python 3.11.x`.

**Step 3 — Install VS Code:** go to `code.visualstudio.com`, download and install, then in VS Code open the Extensions sidebar (Ctrl+Shift+X), search "Python," and install Microsoft's Python extension.

**Step 4 — Install pandas:**
```bash
pip install pandas openpyxl xlrd plotly
```

**Step 5 — First script test:**
```python
import pandas as pd
print("Python is working!")
print("pandas version:", pd.__version__)
```

## Pandas — Your Excel Replacement

A DataFrame is an Excel sheet in Python. Every Excel task maps to a pandas operation — once you know five operations (read, filter, groupby, merge, write) you can automate 80% of your MIS work.

**DataFrame = Excel sheet with superpowers:** `df` is your data, `df.head()` shows the first 5 rows, `df['Revenue']` is one column, `df[['Revenue','Dept']]` is two columns, `df.shape` gives (rows, columns).

```python
import pandas as pd

# Read
df = pd.read_excel("monthly_sales.xlsx")

# Filter
south_region = df[df["Region"] == "South"]

# Groupby — the pivot table equivalent
by_dept = df.groupby("Dept")["Revenue"].sum()

# Merge — the VLOOKUP equivalent
combined = pd.merge(sales_df, hr_df, on="Employee_ID", how="left")

# Write
combined.to_excel("combined_report.xlsx", index=False)
```

**Quick reference — most used pandas code:**

| Task | Code | Excel equivalent |
|---|---|---|
| Read Excel | `df = pd.read_excel("file.xlsx")` | Open file |
| Filter rows | `df[df["Region"] == "South"]` | Filter button |
| Group and sum | `df.groupby("Dept")["Rev"].sum()` | PivotTable |
| VLOOKUP | `pd.merge(df1, df2, on="ID", how="left")` | VLOOKUP |
| New column | `df["Pct"] = df["Actual"] / df["Target"]` | Formula column |
| Sort | `df.sort_values("Revenue", ascending=False)` | Sort Z-A |
| Save Excel | `df.to_excel("output.xlsx", index=False)` | Save As |

## Automation

Once your Python script consolidates files and calculates KPIs, schedule it to run automatically. Schedule it once — every Monday at 8am it runs, and the report is done and emailed by the time you arrive.

```python
import glob
import pandas as pd
import smtplib
from email.message import EmailMessage

def run_weekly_report():
    files = glob.glob("team_reports/*.xlsx")
    combined = pd.concat([pd.read_excel(f) for f in files], ignore_index=True)
    summary = combined.groupby("Dept").agg(Total=("Revenue", "sum"))
    summary.to_excel("weekly_summary.xlsx")

    msg = EmailMessage()
    msg["Subject"] = "Weekly Sales Summary"
    msg["From"] = "reports@company.com"
    msg["To"] = "manager@company.com"
    msg.set_content("Attached is this week's automated report.")
    with open("weekly_summary.xlsx", "rb") as f:
        msg.add_attachment(f.read(), maintype="application",
                            subtype="octet-stream", filename="weekly_summary.xlsx")
    with smtplib.SMTP("smtp.company.com", 587) as server:
        server.starttls()
        server.login("reports@company.com", "app_password")
        server.send_message(msg)

if __name__ == "__main__":
    run_weekly_report()
```
Scheduled via Windows Task Scheduler (weekly, Monday 8am) or `cron` (`0 8 * * 1`) on a server — the script itself doesn't need to know about scheduling, the OS-level scheduler simply runs it at the configured time.

## SQL Basics

SQL is how you ask a database "give me all sales from January for the South region." Once you know `SELECT`, `WHERE`, `GROUP BY`, and `JOIN`, you can get any data directly without waiting for IT or a colleague to export a CSV for you.

```python
import pandas as pd
from sqlalchemy import create_engine

engine = create_engine("postgresql://user:pass@host:5432/salesdb")

query = """
SELECT region, SUM(revenue) AS total_revenue
FROM sales
WHERE order_date >= '2026-01-01'
GROUP BY region
ORDER BY total_revenue DESC
"""
df = pd.read_sql(query, engine)
```
This single pattern — write SQL, load directly into a DataFrame — replaces the "ask IT for an export, wait a day, open the CSV" cycle entirely, and can be scheduled the same way the file-consolidation automation above is.
