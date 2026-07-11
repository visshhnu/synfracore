# Apache Airflow — Learning Roadmap

## Stage 1 — Python fluency, if not already solid (1 week)

DAGs are real Python code (see Prerequisites) — don't start Airflow-specific learning without genuine comfort writing functions and basic classes first.

## Stage 2 — Get Airflow running locally, and write a real first DAG (3-5 days)

Use the Docker Compose setup (see Installation) — it's the officially recommended path and mirrors production's multi-service architecture better than a bare pip install. Write and run the hello-world DAG yourself, then modify it into something with a real (if small) multi-task dependency chain, so the `>>` dependency syntax and task-instance state model (Fundamentals) become concrete rather than abstract.

## Stage 3 — Scheduling and `catchup`, deliberately (2-3 days)

This deserves dedicated, focused attention specifically because it's a common source of real mistakes (Fundamentals) — deliberately create a DAG with a `start_date` from the past, run it once with `catchup=True` and once with `catchup=False`, and observe the difference directly rather than only reading the explanation.

## Stage 4 — Idempotency and retries (1 week)

Write a genuinely non-idempotent task on purpose, trigger a manual re-run, and observe the duplicated/incorrect result — then fix it to be idempotent (Intermediate) and confirm re-running produces the same correct state. This hands-on contrast is what makes idempotency's importance land as a real, felt lesson rather than an abstract best practice.

## Stage 5 — XComs, sensors, and branching (1 week)

Practice passing data between tasks via XCom (and deliberately try passing something too large, to feel why that's the wrong pattern), build a sensor waiting on a real condition (a file, or a simple polling check), and build a branching DAG with a genuine runtime condition determining the path.

## Stage 6 — Dynamic task mapping and custom operators (1-2 weeks)

Build a DAG using dynamic task mapping against a runtime-determined list (Advanced), and — once you've written a few `PythonOperator`s doing similar integration work across different DAGs — practice extracting that logic into a real custom operator instead.

## Stage 7 — Production operational concerns (ongoing)

Study trigger rules deliberately (Advanced) — they're a common source of confusion combined with branching specifically. If you have access to a real multi-worker deployment, get familiar with executor choice and worker/task isolation tradeoffs; otherwise, understand them conceptually and revisit hands-on once you have that access.

## What "done" looks like at each level

- **Junior-ready**: can write a working DAG with task dependencies, understands `catchup`/`start_date` precisely, knows what a task instance is.
- **Mid-level-ready**: writes idempotent tasks by default, uses XComs and sensors correctly (including `mode="reschedule"` for long waits), can build a branching DAG.
- **Senior-ready**: uses dynamic task mapping and custom operators appropriately, understands trigger rules deeply (especially interacting with branching), and can reason about executor choice and production DAG-change safety.
