# Apache Airflow — Troubleshooting

## A new/modified DAG isn't showing up in the UI

Check the scheduler's DAG file parsing — Airflow scans the `dags/` folder periodically (not instantly), so a brief delay after adding or modifying a file is normal, not a bug (see Installation's note on this). If it's been longer than a couple of minutes, check the scheduler's logs directly for a parsing error in your DAG file — a Python syntax error or an exception at DAG-definition time (not inside a task, but in the module-level code that defines the DAG) will silently prevent the DAG from appearing at all, often with no obvious UI-visible error unless you specifically check scheduler logs.

## A task is stuck in "queued" state and never actually starts running

This usually means there's no available worker slot, not that the task is broken — check whether your executor's worker capacity (concurrency settings, worker pool size) is actually sufficient for your current load, and check whether other long-running sensors in `poke` mode (see Intermediate) are unnecessarily holding worker slots that should be free. A sudden increase in stuck-queued tasks after adding new DAGs is a common, real capacity symptom, not usually an individual task's bug.

## Retried task keeps failing with the exact same error

Retries don't fix a deterministic bug — they only help with transient failures (a brief network blip, a momentarily unavailable external service). If a task fails identically on every retry, the cause is deterministic (a real bug in the task's logic, a genuinely missing resource, malformed input data) and no amount of retrying will resolve it; check the actual task logs for the real underlying error rather than assuming more retries will eventually succeed.

## Duplicated or incorrect data after a task was manually re-run

This is almost always an idempotency gap (see Intermediate/Interview Q&A) — check whether the failed/re-run task appends data rather than overwriting/upserting based on the run's logical date. The fix is making the task idempotent (partition by execution date, use upsert logic instead of append), not avoiding re-runs, since re-runs are a routine, expected part of operating Airflow.

## XCom data seems to be missing or `None` when pulled

Check the exact `task_ids` and `key` used in `xcom_pull()` match what was actually used in the corresponding `xcom_push()` — a mismatch (a typo in the key name, referencing the wrong upstream task_id) silently returns `None` rather than raising an obvious error, which is a common source of confusing "why is my data missing" debugging sessions. Also verify the upstream task actually reached the push call — a task that failed before reaching its `xcom_push()` line obviously never pushed anything, which is easy to overlook when debugging the downstream pull side first.

## DAG runs successfully in a test/staging environment but fails or behaves differently in production

Check for environment-specific configuration differences first — connection IDs, variable values, and environment-specific credentials configured through Airflow's Connections/Variables UI (rather than hardcoded) are a common, real source of "works in staging, fails in production" issues when a production-specific connection or variable wasn't actually configured to match what the DAG code expects. Also check `catchup`/`start_date` interactions specifically if the production DAG is newly deployed — a staging environment where you've already run through backfill behavior once can mask a `catchup` issue that then surfaces unexpectedly on a fresh production deployment.
