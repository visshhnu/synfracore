# Apache Airflow — Key Takeaways

- **Airflow orchestrates other tools — it's not a data processing engine itself.** Learning Airflow well assumes you already understand the actual tools your DAGs will call (Spark, SQL, APIs).
- **`catchup=True` (or leaving it at an old default) can trigger a large, unexpected wave of backfilled runs** — explicitly setting `catchup=False` is the safer default for most new DAGs unless automatic backfilling is genuinely intended.
- **Idempotency is a core design requirement in Airflow specifically, not just general good practice** — retries and manual re-runs are routine, expected operations, and a non-idempotent task silently produces incorrect results every time this normal re-execution happens.
- **XComs are for small metadata, never for passing actual datasets between tasks** — write real data to storage and pass a reference via XCom instead.
- **`mode="reschedule"` on sensors avoids holding a worker slot for the entire wait duration** — using default `poke` mode for a long wait is a real, common way to exhaust worker capacity.
- **Branching marks non-chosen paths as "skipped," which interacts non-obviously with downstream trigger rules** — `none_failed` is often what's actually needed downstream of a branch point, not the default `all_success`.
- **Dynamic task mapping generates tasks based on runtime data**, a meaningfully more flexible pattern than a fixed, hardcoded task count determined at DAG-definition time.
- **Custom operators are the correct extension point for repeated integration logic** — extracting shared `PythonOperator` logic into a real operator is a genuine production-maturity signal.
- **Airflow is several coordinated services (scheduler, webserver, metadata database, executor), not one process** — understanding this architecture explains a lot of real troubleshooting (stuck-queued tasks, DAG-parsing delays).
- **Executor choice (Local/Celery/Kubernetes) should follow actual scale and isolation needs**, not be adopted preemptively — each has real, different operational tradeoffs.
