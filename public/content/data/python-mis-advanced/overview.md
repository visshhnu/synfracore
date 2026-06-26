# Python for MIS — Automation & Dashboards

> **Phase 4-6: Automation, Plotly dashboards, Power BI, SQL, future stack**

**Category:** MIS & Analytics  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Python for MIS — Automation & Dashboards?

Phase 4 is the goal most MIS professionals want first — replace the manual weekly consolidation. The script runs automatically at a scheduled time, reads all team files from a shared folder, cleans and merges the data, calculates achievement %, creates a formatted multi-sheet Excel report, and can email it automatically. Once scheduled, you never touch it again.

## Why Python for MIS — Automation & Dashboards?

Plotly creates interactive charts in your browser — hover to see values, click to filter, zoom in. The output is a single HTML file you can email. Recipient opens it in Chrome — no Excel, no Power BI, no software installed. This replaces basic Power BI use cases for internal reports.

---

## Learning Modules

### Module 01 — Phase 4 — Full Automation
*Collect, clean, calculate, save, schedule*

Phase 4 is the goal most MIS professionals want first — replace the manual weekly consolidation. The script runs automatically at a scheduled time, reads all team files from a shared folder, cleans and merges the data, calculates achievement %, creates a formatted multi-sheet Excel report, and can email it automatically. Once scheduled, you never touch it again.

**Topics covered:**

- Collect all team Excel files from a folder — 🟡 Intermediate
- Full consolidation script — 5 steps — 🟡 Intermediate
- Schedule with Windows Task Scheduler — 🟢 Beginner
- Error handling — what if a file is missing? — 🟡 Intermediate
- Email the report automatically — 🟡 Intermediate

```bash
import pandas as pd, os, smtplib
from datetime import datetime
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email import encoders

def run_consolidation():
    folder = "C:/MIS_Data/Weekly_Submissions/"
    all_data = []
    errors = []

    for filename in os.listdir(folder):
        if not filename.endswith(".xlsx"): continue
        try:
            df = pd.read_excel(os.path.join(folder, filename))
            df["Source"] = filename.replace(".xlsx", "")
            all_data.append(df)
            print(f"  Loaded: {filename}")
        except Exception as e:
            errors.append(f"{filename}: {e}")
            print(f"  ERROR: {filename} — {e}")

    if not all_data:
        print("No files found!"); return

    df = pd.concat(all_data, ignore_index=True)
    df = df.drop_duplicates()
    df = df.dropna(subset=["Employee_ID"])
    df["Department"] = df["Department"].str.strip().str.title()
    df["Revenue"] = pd.to_numeric(df["Revenue"], errors="coerce").fillna(0)
    df["Target"]  = pd.to_numeric(df["Target"],  errors="coerce").fillna(0)
    df["Achv_%"]  = (df["Revenue"] / df["Target"] * 100).round(1)
    df["Status"]  = df["Achv_%"].apply(
        lambda p: "Achieved" if p>=100 else ("Near Target" if p>=90 else "Below Target")
    )
    dept = df.groupby("Department").agg(
        Revenue=("Revenue","sum"), Target=("Target","sum"),
        Headcount=("Name","count")
    ).reset_index()
    dept["Achv_%"] = (dept["Revenue"]/dept["Target"]*100).round(1)

    report = f"Weekly_MIS_{datetime.now().strftime('%Y_%m_%d')}.xlsx"
    with pd.ExcelWriter(report, engine="openpyxl") as w:
        dept.to_excel(w, sheet_name="By Department", index=False)
        df.to_excel(w,   sheet_name="All Data",      index=False)
    print(f"Report saved: {report}")
    if errors:
        print(f"WARNINGS — {len(errors)} files had errors:")
        for e in errors: print(f"  {e}")
    return report

def send_email(report_path, to_email):
    msg = MIMEMultipart()
    msg["Subject"] = f"Weekly MIS Report — {datetime.now().strftime('%d %b %Y')}"
    msg["From"] = "mis@company.com"
    msg["To"] = to_email
    msg.attach(MIMEText("Please find attached the weekly MIS report.", "plain"))
    with open(report_path, "rb") as f:
        part = MIMEBase("application", "octet-stream")
        part.set_payload(f.read())
    encoders.encode_base64(part)
    part.add_header("Content-Disposition", f"attachment; filename={report_path}")
    msg.attach(part)
    with smtplib.SMTP("smtp.company.com", 587) as server:
        server.starttls()
        server.login("mis@company.com", "password")
        server.send_message(msg)
    print(f"Email sent to {to_email}")

report = run_consolidation()
if report:
    send_email(report, "manager@company.com")
```

### Module 02 — Phase 5 — Interactive Dashboards
*Plotly — browser-based reports*

Plotly creates interactive charts in your browser — hover to see values, click to filter, zoom in. The output is a single HTML file you can email. Recipient opens it in Chrome — no Excel, no Power BI, no software installed. This replaces basic Power BI use cases for internal reports.

**Topics covered:**

- Matplotlib — static charts saved as PNG — 🟢 Beginner
- Plotly — interactive browser charts — 🟡 Intermediate
- Multi-panel dashboard HTML file — 🟡 Intermediate
- Share dashboard by email (no software needed) — 🟢 Beginner

```bash
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots

df = pd.read_excel("Weekly_MIS_Report.xlsx", sheet_name="By Department")

# Simple bar chart — opens in browser
fig = px.bar(
    df, x="Department", y="Revenue",
    title="Revenue by Department",
    color="Achv_%",
    color_continuous_scale="RdYlGn",  # Red → Yellow → Green
    text="Achv_%"
)
fig.update_traces(texttemplate="%{text:.1f}%", textposition="outside")
fig.write_html("dept_chart.html")  # Save
fig.show()                          # Open in browser

# Multi-panel dashboard
fig2 = make_subplots(
    rows=2, cols=2,
    subplot_titles=[
        "Revenue vs Target by Dept",
        "Achievement % by Dept",
        "Revenue by Region",
        "Status Distribution"
    ]
)
df_region = pd.read_excel("Weekly_MIS_Report.xlsx", sheet_name="All Data")
region = df_region.groupby("Region")["Revenue"].sum().reset_index()
status = df_region["Status"].value_counts().reset_index()

fig2.add_trace(go.Bar(x=df["Department"], y=df["Revenue"], name="Revenue"), row=1, col=1)
fig2.add_trace(go.Bar(x=df["Department"], y=df["Achv_%"],  name="Achv%"),   row=1, col=2)
fig2.add_trace(go.Bar(x=region["Region"], y=region["Revenue"], name="Region"), row=2, col=1)
fig2.add_trace(go.Pie(labels=status["Status"], values=status["count"]),         row=2, col=2)

fig2.update_layout(
    title_text="Weekly MIS Dashboard",
    height=700,
    showlegend=False
)
fig2.write_html("weekly_dashboard.html")
print("Dashboard saved — email weekly_dashboard.html to your manager")
```

### Module 03 — Phase 6 — Future Stack
*SQL, Power BI, Cloud, Airflow — what comes next*

After Python for MIS is solid, the next steps open new career paths. SQL: connect Python directly to databases instead of Excel exports. Power BI: use Python scripts inside Power BI for complex transformations. Airflow: replace Windows Task Scheduler for complex multi-step workflows with dependencies. Cloud: read directly from SharePoint, OneDrive, Azure Blob.

**Topics covered:**

- SQL basics — query databases directly — 🟡 Intermediate
- Power BI + Python — use Python inside Power BI — 🟡 Intermediate
- Apache Airflow — schedule complex workflows — 🔴 Advanced
- Cloud storage — read from SharePoint/OneDrive — 🟡 Intermediate
- Job titles that open up — 🟢 Beginner

```bash
# SQL — connect Python directly to database
import pandas as pd
from sqlalchemy import create_engine

# Connect to SQL Server
engine = create_engine(
    "mssql+pyodbc://user:password@server/database?driver=ODBC+Driver+17+for+SQL+Server"
)

# Query directly into DataFrame — no Excel export needed
df = pd.read_sql("SELECT d.department_name, SUM(s.revenue) AS revenue FROM sales s JOIN departments d ON s.dept_id=d.id GROUP BY d.department_name", engine)

print(df)

# SharePoint — read Excel from SharePoint directly
import requests
from office365.runtime.auth.authentication_context import AuthenticationContext
from office365.sharepoint.client_context import ClientContext

# Read from OneDrive/SharePoint without downloading manually
url = "https://company.sharepoint.com/sites/MIS"
ctx = ClientContext(url).with_user_credentials("user@company.com", "password")

# Job titles after each phase:
# After Python basics:    Junior Data Analyst
# After Pandas:           Data Analyst
# After Automation:       Business Intelligence Analyst / MIS Manager
# After SQL:              Senior Data Analyst
# After Dashboards:       BI Developer
# After Airflow/Cloud:    Data Engineer
# Salary jump:            INR 4-6L → INR 8-15L (India market)
```

---

## Production Example

```bash
# Python for MIS — 6-Month Roadmap

# MONTH 1 — Python Basics
# Week 1: Install Python, VS Code, run first script
# Week 2: Variables, lists, dictionaries
# Week 3: Loops, if/else, functions
# Week 4: File reading, error handling
# Practice: automate one small repetitive task at work

# MONTH 2 — Pandas
# Week 1: Read Excel files, head/shape/columns
# Week 2: Filter, sort, group by
# Week 3: Merge files (replaces VLOOKUP)
# Week 4: Clean data, handle blanks
# Practice: automate your actual weekly data cleaning

# MONTH 3 — Full Automation
# Week 1-2: Complete consolidation script
# Week 3: Schedule with Task Scheduler
# Week 4: Add email sending
# Practice: replace your Monday morning manual work

# MONTH 4 — Dashboards
# Week 1-2: Matplotlib charts
# Week 3-4: Plotly interactive dashboards
# Practice: replace one Excel chart with interactive Plotly

# MONTH 5 — SQL
# Week 1-2: SELECT, WHERE, GROUP BY
# Week 3-4: JOINs, connect Python to database
# Practice: query one real database at work

# MONTH 6 — Present your work
# Create a portfolio of 3 automated scripts
# Document time saved per week
# Show manager: "This script saves 4 hours every Monday"
# Apply for Data Analyst / BI Analyst roles

# LEARNING RESOURCES (free):
# Python:  docs.python.org/3/tutorial
# Pandas:  kaggle.com/learn/pandas
# SQL:     mode.com/sql-tutorial
# Plotly:  plotly.com/python
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Python for MIS — Automation & Dashboards and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Python for MIS — Automation & Dashboards work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Python for MIS — Automation & Dashboards?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Python for MIS — Automation & Dashboards?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Python for MIS — Automation & Dashboards?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Python for MIS — Automation & Dashboards in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Python for MIS — Automation & Dashboards?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Python for MIS — Automation & Dashboards compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Phase 4 — Full Automation in Python for MIS — Automation & Dashboards."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Phase 5 — Interactive Dashboards in Python for MIS — Automation & Dashboards."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Pandas Documentation](https://pandas.pydata.org/docs/)
- [Plotly Python Documentation](https://plotly.com/python/)
- [SQLAlchemy Documentation](https://docs.sqlalchemy.org/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*