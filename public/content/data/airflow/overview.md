# Apache Airflow Overview (Data Engineering)

**Before you start:** basic Python and comfort with the command line are assumed. No prior workflow-orchestration experience is needed.

## Airflow in the Data Engineering Context

A real data pipeline is rarely one script — it's a sequence of steps that depend on each other (extract from an API, wait for that to finish, transform the raw data, wait for that, load it into a warehouse, then refresh a dashboard) and that need to run automatically, on a schedule, with visibility into what succeeded, what failed, and why. Running this by hand, or with a pile of cron jobs and shell scripts, works until a step fails silently at 3am and nobody notices until a stakeholder asks why yesterday's dashboard numbers are wrong. Apache Airflow is a **workflow orchestrator**: it doesn't do the extracting/transforming/loading itself — it schedules, sequences, retries, and monitors the tasks that do, giving you one place to see the whole pipeline's health.

**Analogy** — Think of Airflow like an air traffic control tower, not a pilot. The tower doesn't fly any plane itself, but it knows every flight's dependencies (this plane can't land until that runway is clear), enforces the correct order, and immediately flags a problem (a delayed flight, a missed connection) instead of letting the whole schedule silently drift into chaos. Your actual pipeline logic — the Python function that calls an API, the SQL that transforms data — is the plane; Airflow is the tower making sure everything happens in the right order and telling you the moment something goes wrong.

```
Your code (extract_fn, transform_fn, load_fn)  -->  the "planes"
Airflow (schedule, sequence, retry, monitor)   -->  the "tower"
```

## The Core Abstraction: DAGs

Airflow represents a workflow as a **DAG** (Directed Acyclic Graph) — a set of tasks with dependencies between them, and no cycles (task A can depend on B, but nothing can depend back on A through any path). Almost every real pipeline is naturally acyclic: extract, then transform, then load, in that order, never circling back.

```python
from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

with DAG("etl_pipeline", start_date=datetime(2024, 1, 1), schedule="@daily", catchup=False) as dag:
    extract = PythonOperator(task_id="extract", python_callable=extract_fn)
    transform = PythonOperator(task_id="transform", python_callable=transform_fn)
    load = PythonOperator(task_id="load", python_callable=load_fn)

    extract >> transform >> load   # dependency chain, read left to right
```

`extract >> transform >> load` is Airflow's actual dependency syntax, not decoration — it tells the scheduler `transform` may only start once `extract` has succeeded, and `load` only once `transform` has succeeded. If `extract` fails, Airflow stops there and (depending on retry configuration) retries it automatically, rather than silently running `transform` on missing data.

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "extract", "sublabel": "Pull raw data from a source (API, database, file)", "color": "blue" },
    { "label": "transform", "sublabel": "Clean, reshape, validate the data", "color": "purple" },
    { "label": "load", "sublabel": "Write the result into a warehouse/table", "color": "green" }
  ]
}
```

## Why Airflow Over Alternatives

```conceptgrid
{
  "boxes": [
    { "title": "cron + shell scripts", "description": "No dependency awareness, no retry logic, no visibility into what failed or why -- Airflow exists to replace exactly this", "color": "amber" },
    { "title": "Prefect / Dagster", "description": "Newer orchestrators with similar goals, more Python-native APIs -- Airflow remains the most widely deployed and hired-for", "color": "purple" },
    { "title": "dbt (separate tool)", "description": "dbt handles in-warehouse SQL transformation specifically; Airflow commonly orchestrates dbt runs alongside extract/load steps dbt doesn't do", "color": "blue" },
    { "title": "AWS Step Functions / cloud-native schedulers", "description": "Cloud-provider-specific, less portable; Airflow is cloud-agnostic and runs anywhere Python does", "color": "green" }
  ]
}
```

## Try It (2 Minutes)

No production infrastructure needed — Airflow ships a quickstart that runs entirely on your machine:

```bash
pip install apache-airflow
airflow standalone   # runs the scheduler, webserver, and a local SQLite metadata DB
```

1. Once it starts, open `http://localhost:8080` in a browser (login credentials are printed in the terminal output).
2. Find the `example_bash_operator` DAG in the list (Airflow ships several example DAGs by default) and click the toggle to enable it, then trigger it manually with the "play" button.
3. Click into the run and watch each task go from queued → running → success in sequence — this is the same graph-based execution the `etl_pipeline` example above produces, just with Airflow's built-in example tasks instead of your own `extract_fn`/`transform_fn`/`load_fn`.

## Study Resources
- **Data Pipelines with Apache Airflow** (Bas Harenslak, Julian Rutger de Ruiter) — the standard reference book
- **Apache Airflow official docs** (airflow.apache.org/docs) — authoritative, actively maintained
- **Astronomer Academy** (astronomer.io/academy) — free guides from a major managed-Airflow provider
- **Airflow Summit talks** (YouTube) — real production patterns from companies running Airflow at scale
