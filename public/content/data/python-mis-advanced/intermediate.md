# Python for MIS — Automation & Dashboards — Intermediate

## Scheduling your first automated script

```python
# The core weekly-report script structure
import pandas as pd
from pathlib import Path
from datetime import datetime

def collect_team_files(folder: Path) -> pd.DataFrame:
    all_files = folder.glob("*.xlsx")
    dfs = [pd.read_excel(f) for f in all_files]
    return pd.concat(dfs, ignore_index=True)

def build_report(data: pd.DataFrame) -> pd.DataFrame:
    return data.groupby("team").agg(
        target=("target", "sum"),
        achieved=("achieved", "sum"),
    ).assign(achievement_pct=lambda d: (d["achieved"] / d["target"] * 100).round(1))

if __name__ == "__main__":
    raw = collect_team_files(Path("//shared/team-reports"))
    report = build_report(raw)
    report.to_excel(f"weekly_report_{datetime.now():%Y%m%d}.xlsx")
```

On Windows, **Task Scheduler** runs this on a defined schedule without you touching it — set it once (weekly, a specific day and time), point it at your script, and it runs automatically going forward. On a server/Linux environment, **cron** is the equivalent (`0 8 * * 1` for every Monday at 8am). The actual value of automation isn't the script itself — it's the schedule making it genuinely hands-off, rather than a script you still have to remember to run manually every week.

## Plotly: interactive dashboards as a single HTML file

```python
import plotly.express as px

fig = px.bar(report, x="team", y="achievement_pct", title="Weekly Achievement %")
fig.update_layout(yaxis_title="Achievement %")
fig.write_html("weekly_dashboard.html")
```
The output is one self-contained HTML file — the recipient opens it directly in any browser, with real interactivity (hover for exact values, click legend items to filter series) and zero installed software required on their end. This genuinely replaces a meaningful fraction of what Power BI is used for in many internal-reporting contexts, specifically for "send someone a dashboard" use cases where deploying/licensing a full BI tool would be disproportionate.

## Email automation: closing the loop

```python
import smtplib
from email.message import EmailMessage

def send_report(recipient: str, attachment_path: str):
    msg = EmailMessage()
    msg["Subject"] = "Weekly Achievement Report"
    msg["From"] = "reports@company.com"
    msg["To"] = recipient
    msg.set_content("Attached is this week's automated report.")
    with open(attachment_path, "rb") as f:
        msg.add_attachment(f.read(), maintype="application", subtype="octet-stream", filename=attachment_path)

    with smtplib.SMTP("smtp.company.com", 587) as server:
        server.starttls()
        server.login("reports@company.com", "app_password")  # use an app-specific password, never your real account password
        server.send_message(msg)
```
**Never hardcode a real email account password in a script** — use an app-specific password (most providers support generating one scoped specifically to this purpose) or, better, an environment variable/secrets file excluded from version control. A script that emails itself credentials in plain text in its own source is a genuine, avoidable security gap.

## Multi-sheet Excel output: presenting more than one view at once

```python
with pd.ExcelWriter("full_report.xlsx", engine="openpyxl") as writer:
    report.to_excel(writer, sheet_name="Summary")
    raw.to_excel(writer, sheet_name="Raw Data", index=False)
```
A single-sheet report forces every audience (an executive wanting a summary, an analyst wanting to double-check the underlying numbers) to look at the same view — a multi-sheet workbook lets you present a clean summary alongside the full raw data backing it, in one file, without cluttering the primary view anyone opens first.

## From Python back to Power BI/SQL: when to graduate past scripted automation

A single Python script scheduled via Task Scheduler is the right tool for one team's recurring report. Once the same reporting need scales to many teams, needs real-time (not scheduled-batch) refresh, or needs to be consumed by non-technical stakeholders through a proper self-service BI interface, that's the actual signal to move toward Power BI (or an equivalent BI tool) with a proper SQL-backed data source instead — not because Python "isn't good enough," but because at that point the actual requirement (self-service, real-time, many consumers) has changed to fit a different tool's strengths.
