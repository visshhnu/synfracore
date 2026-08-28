# Python for MIS — Automation & Dashboards

> **Phase 4-6: Automation, Plotly dashboards, Power BI, SQL, future stack**

**Category:** MIS & Analytics  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

---

**Before you start:** [Python for MIS Professionals](/academies/data/python-mis/overview) (Python basics, Pandas fundamentals) is assumed — this page builds full unattended automation and interactive dashboards on top of those foundations.

## What is Python for MIS — Automation & Dashboards?

Phase 4 is the goal most MIS professionals want first — replace the manual weekly consolidation. The script runs automatically at a scheduled time, reads all team files from a shared folder, cleans and merges the data, calculates achievement %, creates a formatted multi-sheet Excel report, and can email it automatically. Once scheduled, you never touch it again.

## Why This Exists (The Hook)

Knowing Pandas well enough to clean and calculate a report manually each week is a real skill, but it still requires a human to remember to run it, watch for a bad file, and hit send. This page exists to close that last gap: a script that runs unattended on a schedule, handles a missing or malformed file without crashing, and emails the finished report itself — the difference between "I know how to automate this" and "this is actually automated."

**Analogy** — Think of this phase like the difference between knowing how to drive and installing cruise control with lane-keeping. Driving manually (running a Pandas script by hand each Monday) still needs a human present and attentive every single time, including remembering to do it at all. This phase adds the equivalent of cruise control and lane-keeping — a scheduler that starts the run automatically, error handling that keeps it on the road when one file is malformed, and an email-send step that delivers the result without you touching the wheel.

**Try it (2 minutes)** — Reason through why a missing weekly email is described as a useful monitoring signal for a fully automated script, without looking anything up: once a script is scheduled and runs unattended, nobody is watching it execute the way they would if running it by hand. If the script's very last step is "email the finished report," and that email never arrives Monday morning, what does that absence directly tell you — and why is that a cheap, already-built alert compared to setting up separate monitoring infrastructure just to watch a script run?

---

## Learning Modules

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "01. Full Automation", "sublabel": "Collect, clean, calculate, save, schedule, email", "color": "blue" },
    { "label": "02. Interactive Dashboards", "sublabel": "Plotly -- browser-based, no software needed", "color": "purple" },
    { "label": "03. Future Stack", "sublabel": "SQL, Power BI + Python, Airflow, cloud storage", "color": "green" }
  ]
}
```

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

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is this Automation & Dashboards phase, and why does it matter more than just knowing pandas basics?**

**A:** **Problem:** knowing pandas syntax alone doesn't produce the actual outcome most MIS professionals want first — a fully automated report that runs without any manual step, and a way to share results more engaging than a static spreadsheet. **Solution:** this phase combines the earlier pandas skills into a genuinely complete automation (scheduled, self-running, with error handling and automatic email delivery) and adds Plotly for interactive, browser-based dashboards shareable as a single HTML file, no Power BI license required. **Result:** this is the phase where the underlying skills turn into something with real, immediately visible workplace value — a report that used to take hours now runs unattended and gets emailed automatically.

---

**Q2. How does the full automation script's architecture work, including its error handling?**

**A:** **Problem:** a production automation script needs to handle a genuinely messy real-world input (a missing file, a malformed row) without crashing entirely and losing the whole week's report. **Solution:** the script iterates through files in a shared folder, wrapping each file's read in a try/except so one bad file gets logged as an error and skipped rather than crashing the whole run; successfully-loaded data gets concatenated, cleaned, and has metrics calculated; the final multi-sheet report is written and then emailed automatically via SMTP. **Result:** the try/except-per-file pattern is specifically what makes this genuinely production-usable rather than a demo script — a real weekly batch will eventually include at least one problematic file, and the script needs to degrade gracefully, not fail completely.

---

**Q3. What are the main components of this automation and dashboarding stack?**

**A:** **Problem:** "automation and dashboards" spans genuinely distinct capabilities worth separating. **Solution:** the consolidation/automation layer (pandas + os + a scheduler), the notification layer (smtplib for automatic email delivery), the static visualization layer (matplotlib), and the interactive dashboard layer (Plotly, including multi-panel dashboards via `make_subplots`). **Result:** knowing which layer handles which concern is what lets you debug effectively — a dashboard rendering wrong is a Plotly issue, a report not arriving is an SMTP/scheduling issue, and a wrong number in the report is a pandas calculation issue, three genuinely different debugging paths.

---

**Q4. How do you handle failures specifically in the automated email-sending step?**

**A:** **Problem:** SMTP authentication failures, network issues, or an invalid recipient address can all cause email delivery to fail silently if not handled explicitly. **Solution:** wrap the `send_email` call in its own try/except separate from the report-generation logic, so a report that generated successfully but failed to SEND is distinguishable from a report that failed to generate at all — and log/alert differently for each case, since "report exists but wasn't emailed" has a different, often simpler fix (resend manually) than "report generation itself failed." **Result:** separating these two failure modes (generation vs. delivery) is what lets you diagnose and recover quickly rather than treating "the Monday report didn't arrive" as one undifferentiated problem.

---

**Q5. What is your production experience with this level of MIS automation — full scheduling, email, and dashboards?**

**A:** This is a genuinely personal question — answer with a real example using the Problem → Solution → Result structure: a fully scheduled report that replaced real manual Monday-morning work, a Plotly dashboard that replaced a static Excel chart people actually preferred using, or a specific error-handling case (a missing file, a failed email send) you had to account for. Whoever's asking is listening for whether you've actually run something like this in production, not just written the code once.

---

**Q6. How do you monitor a fully automated, scheduled MIS pipeline to know it's actually working?**

**A:** **Problem:** once a script is scheduled and unattended, there's no one watching it run the way there would be for a manual process — a silent failure could go unnoticed for weeks. **Solution:** the automatic email delivery itself doubles as a lightweight monitoring signal (a missing Monday email is the alert that something broke), combined with explicit logging of load errors and a periodic manual spot-check comparing the automated report's numbers against a manual calculation to catch a subtle calculation bug the automation wouldn't flag as an "error" on its own. **Result:** full automation doesn't mean zero oversight — it shifts oversight from "watching it run" to "periodically verifying its output is still correct," a different but still-necessary kind of attention.

---

**Q7. What are the security considerations for this level of automation, particularly the SQL/SharePoint integration in Phase 6?**

**A:** **Problem:** connecting Python directly to a database or SharePoint means the script now holds real credentials with real access to production data systems, a meaningfully bigger exposure than reading local Excel files. **Solution:** never hardcode database/SharePoint credentials directly in script source (the example code's inline password is illustrative only, not a production pattern) — use environment variables, a credentials manager, or (for Azure-connected environments) managed identity where available; and scope the database connection's own permissions to read-only access on only the specific tables the script actually needs. **Result:** the jump from "reading local Excel files" to "connecting directly to a database" is exactly the point where credential-handling discipline needs to meaningfully increase, not stay the same.

---

**Q8. How does this Python-based dashboard approach compare to Power BI for the same reporting needs?**

**A:** Power BI offers a more polished, drag-and-drop dashboard-building experience and built-in scheduled-refresh infrastructure via Power BI Service, but requires a license and is a separate tool from the automation script itself. Plotly-based HTML dashboards are free, require no separate software for the recipient (just a browser), and integrate directly into the same Python pipeline already doing the data processing — genuinely replacing BASIC Power BI use cases, though Power BI's more advanced modeling (DAX, complex relationships across many tables) isn't something a Plotly HTML file replicates. The right choice depends on whether the reporting need is genuinely basic (Plotly suffices) or requires Power BI's deeper modeling capability.

---

**Q9. Why does the roadmap describe SQL as the natural next step after mastering pandas-based automation?**

**A:** Pandas automation up to this point still depends on OTHER teams manually exporting Excel files for the script to consume — a real bottleneck and failure point (a late file, a malformed export). Connecting Python directly to a database via SQL removes that manual export step entirely, querying live data directly rather than waiting on and depending on someone else's manual Excel export process. This is also why the roadmap frames SQL as opening up more senior job titles (Senior Data Analyst, Data Engineer) — it represents a genuine step up in technical independence from manual data handoffs.

---

**Q10. Walk through building a multi-panel dashboard that shows both departmental revenue and regional performance in one view.**

**A:** Use Plotly's `make_subplots` to define a grid layout (e.g. 2 rows × 2 columns) with titled panels for each metric. Prepare the underlying data with pandas first — a `groupby("Department")` aggregation for departmental revenue, a separate `groupby("Region")` aggregation for regional data — since Plotly visualizes already-aggregated data, it doesn't do the aggregation itself. Add each prepared dataset as its own trace (`go.Bar`, `go.Pie`) to its designated subplot position. Save the combined figure as a single HTML file with `write_html`, which bundles everything (both panels, interactivity) into one file the recipient opens directly in a browser — no separate files or software needed per panel.

---

## Official Resources

- [Pandas Documentation](https://pandas.pydata.org/docs/)
- [Plotly Python Documentation](https://plotly.com/python/)
- [SQLAlchemy Documentation](https://docs.sqlalchemy.org/)

