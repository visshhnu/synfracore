# Advanced Python MIS — Fundamentals

## Charts and Interactive Dashboards

Plotly charts are HTML files — no software needed to view them. Hover over a bar to see exact values, click a department in the legend to hide/show it, zoom in on a date range, share by email or SharePoint link. Build the chart once in Python, and your team uses it forever.

```python
import plotly.express as px
import plotly.graph_objects as go
from plotly.subplots import make_subplots

# Bar chart — revenue by department
fig = px.bar(df, x="Department", y="Revenue", color="Region",
             title="Revenue by Department")
fig.write_html("revenue_dashboard.html")

# Scatter — ad spend vs. conversions
fig2 = px.scatter(df, x="AdSpend", y="Conversions", color="Channel",
                   size="Impressions", hover_data=["Campaign"])

# Multi-chart dashboard in one HTML file
fig3 = make_subplots(rows=2, cols=1, subplot_titles=("Revenue Trend", "Regional Split"))
fig3.add_trace(go.Scatter(x=df["Month"], y=df["Revenue"]), row=1, col=1)
fig3.add_trace(go.Bar(x=df["Region"], y=df["Revenue"]), row=2, col=1)
fig3.write_html("full_dashboard.html")
```

## Forecasting — Predict Next Month

| Method | Best for | How it works |
|---|---|---|
| Moving Average | Stable businesses with no clear trend | Average of the last 3-6 months |
| Linear Trend | Consistently growing or declining businesses | Fit a line through historical data, extend it |
| Year-over-Year | Seasonal businesses (retail, agriculture) | Same month last year × growth rate |

```python
import numpy as np

# Moving average
df["MA3_forecast"] = df["Revenue"].rolling(3).mean().iloc[-1]

# Linear trend
x = np.arange(len(df))
slope, intercept = np.polyfit(x, df["Revenue"], 1)
next_month_forecast = slope * len(df) + intercept

# Year-over-year
last_year_same_month = df[df["Month"] == "2025-07"]["Revenue"].values[0]
growth_rate = df["Revenue"].pct_change(12).iloc[-1]
yoy_forecast = last_year_same_month * (1 + growth_rate)

print(f"Moving avg: {df['MA3_forecast']:.0f} | Linear: {next_month_forecast:.0f} | YoY: {yoy_forecast:.0f}")
```

## Apache Airflow — Pipeline Management

Task Scheduler runs one script. Airflow manages many scripts with dependencies, retries, and full visibility — a diagram of the entire pipeline, automatic retries on failure, and an email if a step fails three times, with full run history always available.

**Do not start with Airflow.** Learn Python automation first, get it working, then move to Airflow once the dependency management and visibility are genuinely needed — month 6, not month 1.

```python
from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime, timedelta

default_args = {"retries": 3, "retry_delay": timedelta(minutes=5)}

with DAG("weekly_mis_pipeline", start_date=datetime(2026, 1, 1),
         schedule_interval="0 8 * * 1", default_args=default_args) as dag:

    collect = PythonOperator(task_id="collect_files", python_callable=collect_team_files)
    process = PythonOperator(task_id="process_data", python_callable=build_report)
    load = PythonOperator(task_id="load_to_sql", python_callable=load_to_azure_sql)
    notify = PythonOperator(task_id="notify_team", python_callable=send_summary_email)

    collect >> process >> load >> notify   # defines the dependency order
```

## Azure Cloud — Automation Without Your Laptop

A laptop-based automation script has one weakness: your laptop must be on. Azure Functions runs your Python script in the cloud on a schedule, Azure Storage holds your data, and Power BI connects directly to Azure SQL — the full pipeline runs Monday at 8am whether you're at your desk, on leave, or asleep.

```python
# Azure Function — timer-triggered, runs the weekly pipeline
import azure.functions as func
from azure.storage.blob import BlobServiceClient
import pyodbc

def main(mytimer: func.TimerRequest) -> None:
    conn = pyodbc.connect(
        "Driver={ODBC Driver 18 for SQL Server};"
        "Server=my-server.database.windows.net;Database=mis_db;"
        "Uid=admin;Pwd={your_password};Encrypt=yes;"
    )
    report = build_weekly_report()
    report.to_sql("weekly_summary", conn, if_exists="replace", index=False)
```

**How to get started free:** create an Azure free account at `azure.microsoft.com/free` (no payment required), create a Storage Account and upload one of your Excel reports, then connect Power BI to it directly — one weekend of setup and your dashboard reads from the cloud forever after.

## Complete Cheatsheet

| Task | Code |
|---|---|
| Read Excel | `pd.read_excel("file.xlsx")` |
| Read specific sheet | `pd.read_excel("file.xlsx", sheet_name="Q1")` |
| Merge multiple files | `pd.concat([pd.read_excel(f) for f in files])` |
| Filter AND | `df[(df["Dept"]=="Sales") & (df["Rev"]>100000)]` |
| Group and calculate | `df.groupby("Dept").agg(Total=("Rev","sum"), Count=("ID","count"))` |
| Pivot table | `pd.pivot_table(df, values="Rev", index="Dept", columns="Month")` |
| VLOOKUP | `pd.merge(df1, df2, on="ID", how="left")` |
| Achievement % | `df["Pct"] = (df["Actual"]/df["Target"]*100).round(1)` |
| Top 10 rows | `df.nlargest(10, "Revenue")` |
| Running total | `df["CumRev"] = df["Revenue"].cumsum()` |
| Month from date | `df["Month"] = pd.to_datetime(df["Date"]).dt.month_name()` |
| Write to Excel | `df.to_excel("output.xlsx", index=False)` |
| Write multiple sheets | `with pd.ExcelWriter("out.xlsx") as w: df.to_excel(w, sheet_name="Data")` |
| 3-month moving avg | `df["MA3"] = df["Revenue"].rolling(3).mean()` |
| Fill missing | `df["Rev"].fillna(0)` |
| Remove duplicates | `df.drop_duplicates(subset=["Employee_ID"])` |
| SQL to DataFrame | `pd.read_sql("SELECT * FROM Sales", engine)` |

## Interview Q&A

**How would you build a complete automated MIS pipeline end-to-end?**
Four stages. **Collection**: Python watches a shared folder for incoming files using `glob.glob()`; missing files trigger a reminder email. **Processing**: pandas reads and concatenates all files, runs data-quality checks (missing IDs, negative values, duplicate records — if any check fails, alert the MIS team rather than produce a wrong output), then calculates KPIs via `groupby` for department/region totals and `pd.merge` to bring in HR data. **Output**: `openpyxl` generates a formatted Excel file with conditional formatting and charts, and clean data loads to Azure SQL for Power BI. **Distribution**: the report emails to a distribution list, a summary posts to Teams, and the Power BI dashboard auto-refreshes from Azure SQL. Scheduling runs via an Azure Function every Monday at 8am, with a full audit log and error alerts if any stage fails.

**What is Apache Airflow and when should an MIS team use it?**
Airflow manages complex automated workflows via a DAG — a map of tasks with dependencies, where Task B only runs if Task A succeeds, retries a failing task automatically before alerting, and keeps a full visual diagram and run history with logs. For an MIS team specifically, reach for Airflow once there are more than 3 Python scripts depending on each other, once retry logic for unreliable data sources becomes genuinely necessary, once multiple people need visibility into pipeline status without asking the one person who wrote the script, or once you need conditional branching (different steps depending on whether a data-quality check passed) that a simple sequential script can't express cleanly.
