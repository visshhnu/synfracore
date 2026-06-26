# Python for MIS

> **Zero to job-ready — Excel automation with Python, Pandas, dashboards**

**Category:** MIS & Analytics  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Python for MIS?

Python does not replace what you know — it automates what you already do. Every Monday your script can wake up, collect files from all teams, clean them, merge them, calculate everything, create the report, and email it to your manager — without you touching anything. Setup: download Python from python.org, check "Add Python to PATH", install VS Code editor.

## Why Python for MIS?

Python basics mapped to Excel concepts you already know. A list is like a column. A dictionary is like one row with column names as keys. A loop is like dragging a formula down every row. If/else is exactly the Excel IF function. Functions are like named formulas you can reuse.

---

## Learning Modules

### Module 01 — Why Python for MIS?
*What it replaces, what it automates*

Python does not replace what you know — it automates what you already do. Every Monday your script can wake up, collect files from all teams, clean them, merge them, calculate everything, create the report, and email it to your manager — without you touching anything. Setup: download Python from python.org, check "Add Python to PATH", install VS Code editor.

**Topics covered:**

- Python vs Excel — what each is good for — 🟢 Beginner
- What can be automated in your MIS role — 🟢 Beginner
- Install Python on Windows — 🟢 Beginner
- VS Code setup for MIS professionals — 🟢 Beginner

```bash
# Verify Python is installed — run in Command Prompt
python --version
# Should show: Python 3.11.x

# Install the libraries you need for MIS work
pip install pandas openpyxl matplotlib plotly

# pandas     — works with Excel data (most important)
# openpyxl   — reads and writes .xlsx files
# matplotlib — creates charts and graphs
# plotly     — creates interactive browser dashboards

# Your first Python line
print("Python is working!")

# Store data in variables (like Excel cells)
employee_name = "Ravi Kumar"
salary = 75000
department = "Sales"
print(f"{employee_name} works in {department} and earns {salary:,}")
# Output: Ravi Kumar works in Sales and earns 75,000
```

### Module 02 — Python Basics for MIS
*Variables, lists, dictionaries, loops*

Python basics mapped to Excel concepts you already know. A list is like a column. A dictionary is like one row with column names as keys. A loop is like dragging a formula down every row. If/else is exactly the Excel IF function. Functions are like named formulas you can reuse.

**Topics covered:**

- Variables and data types — 🟢 Beginner
- Lists — like a column in Excel — 🟢 Beginner
- Dictionaries — like a row in Excel — 🟢 Beginner
- Loops — like dragging a formula down — 🟢 Beginner
- If/else — like Excel IF function — 🟢 Beginner
- Functions — reusable blocks of code — 🟡 Intermediate

```bash
# LIST — like a single column in Excel
departments = ["Sales", "Finance", "Operations", "HR", "IT"]
print(len(departments))      # 5 — how many items
print(departments[0])        # Sales — first item (starts at 0)
print(departments[-1])       # IT — last item

# LOOP — like dragging formula down each row
for dept in departments:
    print(f"Department: {dept}")

# DICTIONARY — like one row with column headers as keys
employee = {
    "name":       "Ravi Kumar",
    "department": "Sales",
    "salary":     75000,
    "target":     100000
}
print(employee["name"])      # Ravi Kumar
print(employee["salary"])    # 75000

# IF/ELSE — exactly like Excel IF function
achievement = employee["salary"] / employee["target"] * 100
if achievement >= 100:
    status = "Achieved"
elif achievement >= 90:
    status = "Near Target"
else:
    status = "Below Target"
print(f"{employee['name']}: {achievement:.1f}% — {status}")

# FUNCTION — reusable block you define once, use many times
def get_status(revenue, target):
    pct = revenue / target * 100
    if pct >= 100: return "Achieved"
    elif pct >= 90: return "Near Target"
    else: return "Below Target"

print(get_status(95000, 100000))   # Near Target
print(get_status(105000, 100000))  # Achieved
```

### Module 03 — Pandas — Excel in Python
*Read, filter, sort, group Excel files*

Pandas is the most important library for MIS professionals. A DataFrame is a table with rows and columns — exactly like an Excel sheet. Everything you do in Excel (filter, sort, group, merge, calculate) can be done in Pandas with code — so it can be automated and repeated without manual work.

**Topics covered:**

- Read Excel and CSV files into DataFrame — 🟢 Beginner
- View data — head, shape, columns, dtypes — 🟢 Beginner
- Filter rows — like Excel AutoFilter — 🟢 Beginner
- Sort data — like Excel Sort — 🟢 Beginner
- Group and aggregate — like Pivot Table — 🟡 Intermediate
- Merge files — like VLOOKUP — 🟡 Intermediate
- Clean data — remove blanks, fix formats — 🟡 Intermediate

```bash
import pandas as pd

# ── READ DATA ────────────────────────────────────────
df = pd.read_excel("Sales_Report.xlsx")
df = pd.read_excel("Report.xlsx", sheet_name="January")
df = pd.read_csv("data.csv")

# ── VIEW DATA ────────────────────────────────────────
print(df.shape)              # (523, 8) = 523 rows, 8 columns
print(df.columns.tolist())   # ['Name', 'Dept', 'Revenue', 'Target']
print(df.head())             # first 5 rows
print(df.isnull().sum())     # blank cells per column

# ── FILTER — like Excel AutoFilter ──────────────────
sales = df[df["Department"] == "Sales"]
high  = df[df["Revenue"] > 100000]
both  = df[(df["Department"] == "Sales") & (df["Region"] == "South")]
multi = df[df["Department"].isin(["Sales", "Finance", "IT"])]

# ── SORT — like Excel Sort ───────────────────────────
df_sorted = df.sort_values("Revenue", ascending=False)

# ── GROUP — like Pivot Table ─────────────────────────
dept_summary = df.groupby("Department").agg(
    Total_Revenue = ("Revenue", "sum"),
    Total_Target  = ("Target",  "sum"),
    Headcount     = ("Name",    "count")
).reset_index()
dept_summary["Achievement_%"] = (
    dept_summary["Total_Revenue"] / dept_summary["Total_Target"] * 100
).round(1)

# ── MERGE — like VLOOKUP ─────────────────────────────
# targets.xlsx has: Department, Annual_Target
targets = pd.read_excel("targets.xlsx")
merged = pd.merge(df, targets, on="Department", how="left")

# ── CLEAN DATA ───────────────────────────────────────
df = df.drop_duplicates()
df = df.dropna(subset=["Employee_ID"])  # remove rows with no ID
df["Department"] = df["Department"].str.strip().str.title()
df["Revenue"]    = pd.to_numeric(df["Revenue"], errors="coerce").fillna(0)
```

### Module 04 — Full Automation Script
*Weekly consolidation — complete working script*

This is what you build toward — a complete weekly MIS consolidation script. It reads all team Excel files from a folder, cleans the data, calculates achievement %, creates summaries by department and region, and saves a formatted multi-sheet report. Schedule it in Windows Task Scheduler to run every Monday at 8am automatically.

**Topics covered:**

- Collect all team files from a folder automatically — 🟡 Intermediate
- Clean and standardise data — 🟡 Intermediate
- Calculate metrics — achievement %, variance — 🟡 Intermediate
- Save multi-sheet Excel report — 🟡 Intermediate
- Schedule with Windows Task Scheduler — 🟡 Intermediate

```bash
import pandas as pd
import os
from datetime import datetime

def run_weekly_consolidation():
    print("=" * 50)
    print("WEEKLY MIS CONSOLIDATION")
    print(f"Running at: {datetime.now().strftime('%d-%m-%Y %H:%M')}")
    print("=" * 50)

    # STEP 1: Collect all team Excel files from folder
    folder = "C:/MIS_Data/Weekly_Submissions/"
    all_data = []
    for filename in os.listdir(folder):
        if filename.endswith(".xlsx"):
            df_team = pd.read_excel(os.path.join(folder, filename))
            df_team["Source"] = filename.replace(".xlsx", "")
            all_data.append(df_team)
            print(f"  Loaded: {filename} — {len(df_team)} rows")
    df = pd.concat(all_data, ignore_index=True)
    print(f"  Total: {len(df)} rows")

    # STEP 2: Clean
    df = df.drop_duplicates()
    df = df.dropna(subset=["Employee_ID"])
    df["Department"] = df["Department"].str.strip().str.title()
    df["Revenue"]    = pd.to_numeric(df["Revenue"], errors="coerce").fillna(0)
    df["Target"]     = pd.to_numeric(df["Target"],  errors="coerce").fillna(0)

    # STEP 3: Calculate metrics
    df["Achievement_%"] = (df["Revenue"] / df["Target"] * 100).round(1)
    df["Variance"]      = df["Revenue"] - df["Target"]
    df["Status"]        = df["Achievement_%"].apply(
        lambda p: "Achieved" if p >= 100 else ("Near Target" if p >= 90 else "Below Target")
    )

    # STEP 4: Summaries
    dept_sum = df.groupby("Department").agg(
        Revenue=("Revenue","sum"), Target=("Target","sum"),
        Headcount=("Name","count")
    ).reset_index()
    dept_sum["Achv_%"] = (dept_sum["Revenue"]/dept_sum["Target"]*100).round(1)

    # STEP 5: Save multi-sheet Excel report
    report = f"Weekly_MIS_{datetime.now().strftime('%Y_%m_%d')}.xlsx"
    with pd.ExcelWriter(report, engine="openpyxl") as w:
        dept_sum.to_excel(w, sheet_name="By Department", index=False)
        df.to_excel(w,       sheet_name="All Data",      index=False)
    print(f"Report saved: {report}")

run_weekly_consolidation()

# SCHEDULE IT — Windows Task Scheduler:
# Program: python
# Arguments: C:\\Scripts\\weekly_consolidation.py
# Trigger: Weekly, Monday, 08:00 AM
```

### Module 05 — Dashboards with Plotly
*Interactive browser reports — no Power BI needed*

Plotly creates interactive charts that open in a browser — you can hover, zoom, filter. Save as a single HTML file and share by email — recipient opens it in Chrome without any software installed. No Power BI licence needed for basic interactive reports.

**Topics covered:**

- Bar and line charts with Plotly — 🟡 Intermediate
- Interactive HTML dashboard — 🟡 Intermediate
- Share dashboard as a file — 🟢 Beginner

```bash
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots

df = pd.read_excel("Sales_Report.xlsx")

# Simple bar chart
fig = px.bar(
    df.groupby("Department")["Revenue"].sum().reset_index(),
    x="Department", y="Revenue",
    title="Revenue by Department",
    color="Revenue",
    color_continuous_scale="Blues"
)
fig.write_html("dept_chart.html")   # Save — open in any browser
fig.show()                          # Opens in browser immediately

# Multi-chart dashboard
fig2 = make_subplots(rows=1, cols=2,
    subplot_titles=["Revenue by Dept", "Achievement %"])

dept = df.groupby("Department").agg(
    Revenue=("Revenue","sum"), Target=("Target","sum")
).reset_index()
dept["Achv"] = (dept["Revenue"]/dept["Target"]*100).round(1)

fig2.add_trace(go.Bar(x=dept["Department"], y=dept["Revenue"], name="Revenue"), row=1, col=1)
fig2.add_trace(go.Bar(x=dept["Department"], y=dept["Achv"],    name="Achv %"),  row=1, col=2)
fig2.update_layout(title="MIS Weekly Dashboard", height=500)
fig2.write_html("dashboard.html")
print("Dashboard saved — share dashboard.html by email")
```

---

## Production Example

```bash
# Python for MIS — Career Roadmap

# WHAT YOU CAN DO AFTER EACH PHASE:

# After Phase 1+2 (Python Basics):
# — Write simple scripts, understand code, ask better questions

# After Phase 3 (Pandas):
# — Automate any Excel consolidation task
# — Replace manual VLOOKUP and Pivot Table work
# — Job title: Data Analyst

# After Phase 4 (Automation):
# — Schedule reports to run without human intervention
# — Process hundreds of files in seconds
# — Job title: Business Intelligence Analyst

# After Phase 5 (Dashboards):
# — Build interactive reports shared via browser
# — Replace basic Power BI use cases
# — Job title: MIS Manager / Data Analyst Lead

# STUDY PLAN — 1 hour per day:
# Month 1: Phases 1+2 — Python basics, run your first script
# Month 2: Phase 3 — Pandas, automate your actual weekly report
# Month 3: Phase 4+5 — Automation + Dashboard, show it at work
# Month 4: SQL basics, connect Python to databases

# FREE RESOURCES:
# Python official tutorial:  docs.python.org/3/tutorial
# Pandas tutorial:           pandas.pydata.org/docs/getting_started
# Kaggle Learn (free):       kaggle.com/learn/pandas
# Practice datasets:         Kaggle Datasets (search "sales data")
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Python for MIS and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Python for MIS work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Python for MIS?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Python for MIS?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Python for MIS?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Python for MIS in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Python for MIS?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Python for MIS compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Why Python for MIS? in Python for MIS."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Python Basics for MIS in Python for MIS."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Python Official Tutorial](https://docs.python.org/3/tutorial/)
- [Pandas Getting Started](https://pandas.pydata.org/docs/getting_started/)
- [Plotly Documentation](https://plotly.com/python/)
- [Kaggle Learn — Pandas (Free)](https://www.kaggle.com/learn/pandas)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*