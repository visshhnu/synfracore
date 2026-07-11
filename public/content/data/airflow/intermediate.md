# Apache Airflow — Intermediate

## Idempotency: the design principle that makes retries safe

A task is idempotent if running it multiple times with the same input produces the same result as running it once — no duplicated data, no compounding side effects. This matters enormously in Airflow specifically because retries (see below) and manual re-runs are routine, expected operations, not rare exceptions — a task that appends data on every run (rather than overwriting/upserting) will silently duplicate data every time it's retried or manually re-triggered, which is a genuinely common, real production bug rooted in a task that wasn't designed idempotently from the start.

```python
# Not idempotent — re-running this task duplicates rows
def load_data():
    df.write.mode("append").parquet("output/")

# Idempotent — re-running produces the same end state
def load_data(execution_date):
    df.write.mode("overwrite").parquet(f"output/date={execution_date}/")
```

Partitioning output by the DAG run's logical date (rather than always appending to one location) is a common, effective pattern for making tasks naturally idempotent — a re-run overwrites that specific date's partition rather than duplicating data across the whole dataset.

## Retries and failure handling

```python
from airflow.operators.python import PythonOperator
from datetime import timedelta

task = PythonOperator(
    task_id="extract",
    python_callable=extract_fn,
    retries=3,
    retry_delay=timedelta(minutes=5),
    retry_exponential_backoff=True,
)
```

Retries are configured per-task, and `retry_exponential_backoff` (increasing delay between attempts) is worth enabling by default for tasks calling external APIs or services that might be transiently rate-limited or briefly unavailable — a fixed retry delay under a rate limit just means every retry attempt hits the same wall at the same predictable interval.

## XComs: passing small amounts of data between tasks

```python
def extract(**context):
    result = {"row_count": 1500}
    context["ti"].xcom_push(key="extract_result", value=result)

def transform(**context):
    result = context["ti"].xcom_pull(task_ids="extract", key="extract_result")
    print(f"Processing {result['row_count']} rows")
```

XComs (cross-communications) let tasks pass small pieces of data to each other — but they're explicitly designed for small metadata (a row count, a file path, a status flag), not for passing actual datasets between tasks. The metadata database backing XComs isn't built to handle large payloads efficiently — the correct pattern for passing real data between tasks is writing it to actual storage (S3, a database, a shared filesystem) and passing a *reference* (a path, an ID) via XCom, not the data itself.

## Sensors: waiting for an external condition, without wasting resources naively

```python
from airflow.sensors.filesystem import FileSensor

wait_for_file = FileSensor(
    task_id="wait_for_upload",
    filepath="/data/incoming/daily_export.csv",
    poke_interval=60,
    timeout=3600,
    mode="reschedule",   # see below
)
```

A Sensor waits for a condition (a file arriving, a database row appearing, an external API returning a specific status) before allowing downstream tasks to proceed. **`mode="reschedule"` vs. the default `mode="poke"` matters at scale**: `poke` mode holds a worker slot occupied for the entire wait duration, checking repeatedly; `reschedule` mode releases the worker slot between checks and re-queues the sensor task, which is far more resource-efficient for long waits — using `poke` mode for a sensor that might wait hours is a common, real way to exhaust available worker capacity unnecessarily.

## Branching: conditional workflow paths

```python
from airflow.operators.python import BranchPythonOperator

def choose_branch(**context):
    return "path_a" if some_condition else "path_b"

branch = BranchPythonOperator(task_id="branch", python_callable=choose_branch)
branch >> [task_a, task_b]
```

`BranchPythonOperator` lets a DAG take different paths based on runtime logic — the returned task_id (or list of task_ids) is the only downstream path that actually executes; other branches are automatically marked "skipped," not run and ignored. This distinction (skipped vs. not-run) matters for how downstream tasks' trigger rules interact with branching, covered further in Advanced.
