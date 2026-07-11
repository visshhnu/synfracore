# Apache Airflow — Fundamentals

## DAGs: workflows as directed acyclic graphs, precisely

A DAG (Directed Acyclic Graph) is Airflow's core abstraction: a workflow expressed as tasks with dependencies between them, where the dependency graph has no cycles — task A can depend on task B, but there's no path back from B to A, directly or transitively. "No cycles" isn't a limitation you'll fight against in practice — most real workflows are naturally acyclic (extract, then transform, then load, in that order), and Airflow enforces this as a structural guarantee that prevents a genuinely broken infinite-dependency scenario.

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

The `>>` operator defines task dependencies directly and readably — `extract >> transform` means transform only starts after extract completes successfully. This is Airflow's actual DSL for expressing a workflow's structure, not just syntactic sugar.

## Operators: the actual units of work

An Operator defines *what* a task does. `PythonOperator` runs arbitrary Python. `BashOperator` runs a shell command. Provider-specific operators (`SparkSubmitOperator`, `PostgresOperator`, `S3ToRedshiftOperator`, and hundreds of others via Airflow's provider packages) wrap common integrations so you're not writing raw API/CLI-calling code yourself for standard operations. Choosing the right operator — a provider-specific one over a generic `PythonOperator` wrapping the same logic manually — usually gets you built-in retry logic, connection management, and logging specific to that integration, for free.

## Scheduling: `schedule` and what `catchup` actually does

```python
with DAG("daily_report", start_date=datetime(2024, 1, 1), schedule="@daily", catchup=False) as dag:
    ...
```

`schedule` accepts cron expressions (`"0 2 * * *"` for 2am daily) or Airflow's presets (`@daily`, `@hourly`). **`catchup` is a genuinely important, frequently-misunderstood setting**: if `True` (Airflow's historical default in older versions), Airflow will run *every* scheduled interval between your DAG's `start_date` and now that hasn't run yet — meaning a DAG with a `start_date` from a year ago, deployed today, would trigger 365 backfilled daily runs immediately unless `catchup=False` is set. This surprises people constantly; explicitly setting `catchup=False` unless you genuinely want automatic backfilling is the safer default for most new DAGs.

## The scheduler, webserver, and metadata database — Airflow's actual architecture

Airflow isn't one process — it's several coordinated services (visible directly in the Docker Compose setup from Installation): the **scheduler** monitors DAGs and triggers tasks when their dependencies and schedule allow; the **webserver** serves the UI for monitoring and manual triggering; a **metadata database** (Postgres in most real deployments) stores DAG run history, task state, and configuration; and an **executor** (which varies — LocalExecutor, CeleryExecutor, KubernetesExecutor) actually runs the task code, with the choice of executor determining how work is distributed and scaled.

## Task instances and state — the actual granularity Airflow tracks

A DAG defines the workflow structure; a **DAG Run** is one specific execution of that structure at a specific scheduled time; a **Task Instance** is one specific task within one specific DAG Run. Airflow tracks state (queued, running, success, failed, retrying) at the task instance level, not just the DAG level — this granularity is what enables re-running just one failed task without re-running an entire otherwise-successful pipeline, a genuinely important operational capability covered further in Intermediate.
