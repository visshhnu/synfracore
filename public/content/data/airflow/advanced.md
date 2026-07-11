# Apache Airflow — Advanced

## Trigger rules: controlling execution beyond simple success dependencies

By default, a task only runs if all its upstream dependencies succeeded. Trigger rules override this for cases where that default isn't what you actually need:

```python
from airflow.operators.python import PythonOperator

cleanup = PythonOperator(
    task_id="cleanup",
    python_callable=cleanup_fn,
    trigger_rule="all_done",   # runs regardless of whether upstream tasks succeeded or failed
)
```

Common trigger rules beyond the default `all_success`: `all_done` (run once upstream tasks finish, regardless of outcome — useful for cleanup/notification tasks that should always run), `one_failed` (run if at least one upstream task failed — useful for alerting-specific tasks), and `none_failed` (run if no upstream task failed, treating skipped as acceptable — relevant specifically when combined with branching, since branching's "skipped" tasks need explicit handling in trigger-rule logic, not just success/failure).

## Dynamic task mapping: generating tasks at runtime based on data

```python
from airflow.decorators import task

@task
def get_file_list():
    return ["file1.csv", "file2.csv", "file3.csv"]  # determined at runtime

@task
def process_file(filename: str):
    print(f"Processing {filename}")

process_file.expand(filename=get_file_list())
```

Dynamic task mapping generates a variable number of parallel task instances based on data only known at runtime (a list of files to process, a list of API endpoints to call) — this is a meaningfully more modern, flexible pattern than manually writing a fixed number of tasks or looping in Python at DAG-definition time (which creates the tasks at DAG-parse time, not based on actual runtime data, and doesn't parallelize the same way).

## Custom operators and sensors — extending Airflow for your specific needs

When existing operators don't cover your specific integration, writing a custom operator (subclassing `BaseOperator`) is the correct extension mechanism, keeping the reusable logic in one place rather than duplicating similar `PythonOperator` code across many DAGs:

```python
from airflow.models import BaseOperator

class MyCustomOperator(BaseOperator):
    def __init__(self, my_param: str, **kwargs):
        super().__init__(**kwargs)
        self.my_param = my_param

    def execute(self, context):
        # actual task logic here
        return result
```

Building custom operators/sensors for genuinely repeated integration patterns (rather than copy-pasting similar `PythonOperator` logic across many DAGs) is a real, significant maturity signal in a production Airflow deployment — it's the difference between a growing collection of ad hoc scripts and an actual reusable internal platform.

## DAG versioning and safe production changes

Changing a DAG's structure (adding/removing tasks, changing dependencies) while it has in-flight or historical runs raises real questions Airflow doesn't fully automate away: historical DAG run graphs in the UI reflect the DAG's structure *as of that run*, which can look confusing after a structural change. Production-grade practice: treat DAG files as version-controlled code (which they are, being Python files) with real code review, test DAG changes in a staging Airflow environment before deploying to production, and be deliberate about `start_date`/`catchup` interactions (see Fundamentals) whenever a DAG's schedule or structure changes, since it directly affects whether Airflow attempts to backfill runs for the changed structure.

## Airflow at scale: executor choice and worker isolation

`LocalExecutor` (single machine, limited parallelism) is fine for learning and small deployments. `CeleryExecutor` distributes task execution across a pool of worker machines, appropriate once single-machine capacity is genuinely insufficient. `KubernetesExecutor` runs each task in its own pod, providing strong per-task resource isolation and the ability to give different tasks genuinely different resource allocations and even different container images — valuable specifically when tasks have meaningfully different dependency/resource needs, at the cost of real added operational complexity (running Airflow on Kubernetes itself, pod startup overhead per task). Choosing between these is a real infrastructure decision that should follow actual scale and isolation requirements, not be adopted preemptively.
