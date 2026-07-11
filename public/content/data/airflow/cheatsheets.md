# Apache Airflow — Quick Reference

## Basic DAG structure

```python
from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

with DAG(
    "my_dag",
    start_date=datetime(2024, 1, 1),
    schedule="@daily",
    catchup=False,
) as dag:
    task1 = PythonOperator(task_id="task1", python_callable=fn1)
    task2 = PythonOperator(task_id="task2", python_callable=fn2)
    task1 >> task2
```

## Schedule presets

| Preset | Meaning |
|---|---|
| `@once` | Run once, no recurring schedule |
| `@hourly` | Every hour |
| `@daily` | Once a day, midnight |
| `@weekly` | Once a week |
| `None` | Manual trigger only, no schedule |
| `"0 2 * * *"` | Cron expression — e.g. 2am daily |

## Task dependency syntax

```python
task1 >> task2                    # task1 runs before task2
task1 << task2                    # equivalent, reversed direction
task1 >> [task2, task3]           # task2 and task3 both depend on task1
[task1, task2] >> task3           # task3 depends on both task1 and task2
```

## XComs

```python
# Push
context["ti"].xcom_push(key="my_key", value=my_small_value)

# Pull
value = context["ti"].xcom_pull(task_ids="upstream_task", key="my_key")
```

## Retry configuration

```python
PythonOperator(
    task_id="...", python_callable=fn,
    retries=3,
    retry_delay=timedelta(minutes=5),
    retry_exponential_backoff=True,
)
```

## Trigger rules, quick reference

| Rule | Runs when |
|---|---|
| `all_success` (default) | All upstream tasks succeeded |
| `all_done` | All upstream tasks finished, regardless of outcome |
| `one_failed` | At least one upstream task failed |
| `none_failed` | No upstream task failed (skipped is OK) — relevant with branching |

## Sensor modes

| Mode | Behavior |
|---|---|
| `poke` (default) | Holds a worker slot for the entire wait, checking repeatedly |
| `reschedule` | Releases the worker slot between checks — use for long waits |

## Dynamic task mapping

```python
@task
def get_items(): return [...]  # runtime-determined list

@task
def process(item): ...

process.expand(item=get_items())
```

## Useful CLI commands

```bash
airflow dags list
airflow dags trigger <dag_id>
airflow tasks test <dag_id> <task_id> <execution_date>   # test a single task without a full run
airflow db migrate
```
