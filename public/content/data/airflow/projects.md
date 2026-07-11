# Apache Airflow — Portfolio Projects

## Project 1: A real, multi-step ETL DAG (Beginner)

Build a DAG that extracts data from a real source (a public API, a CSV file), transforms it (basic cleaning/aggregation), and loads it somewhere real (a local database, a file). Use proper task dependencies (`>>`), not a single monolithic task doing everything.

**What this demonstrates:** you can structure a real workflow as discrete, dependent tasks — the actual point of using Airflow instead of a single script. **What to show:** the DAG code, and a screenshot of the Airflow UI's graph view showing the actual task dependency structure running successfully.

## Project 2: Idempotency demonstrated deliberately (Beginner/Intermediate)

Build a DAG where a task writes output partitioned by execution date (idempotent, see Intermediate), then deliberately trigger a manual re-run of a past DAG run and show the output is correct and not duplicated.

**What this demonstrates:** you understand idempotency as an applied design principle, not just a term — this is a genuinely common thing production Airflow work gets wrong, so demonstrating it correctly is a real, specific signal. **What to show:** the before/after state of your output data across the original run and the manual re-run — the *lack* of duplication is the actual point.

## Project 3: A DAG with sensors, branching, and proper retry configuration (Intermediate)

Build a DAG that waits on an external condition via a sensor (using `mode="reschedule"`), branches based on some runtime-determined condition, and has properly configured retries with exponential backoff on at least one task that calls an external service.

**What this demonstrates:** the intermediate operational patterns (Intermediate) applied together in one realistic workflow, not each in isolation. **What to show:** the DAG code with clear comments on *why* you chose `reschedule` mode and your specific retry configuration, not just that they're present.

## Project 4: Dynamic task mapping against real runtime data (Advanced)

Build a DAG that determines a variable-length list of work items at runtime (files in a directory, rows from a query) and uses dynamic task mapping (Advanced) to process each in parallel, rather than a fixed, hardcoded number of tasks.

**What this demonstrates:** a genuinely more modern Airflow pattern than many existing tutorials still show — this is a real differentiator in a portfolio. **What to show:** a run where the number of mapped task instances visibly differs between two different executions (proving it's actually runtime-determined, not just a fixed-count DAG dressed up to look dynamic).

## Project 5: A custom operator, extracted from repeated logic (Advanced)

Write two or three DAGs that share a similar integration pattern (calling the same kind of external API, writing to the same kind of destination) using `PythonOperator` first, then refactor the shared logic into a real custom operator (subclassing `BaseOperator`) and update the DAGs to use it.

**What this demonstrates:** the maturity signal of building reusable internal tooling rather than duplicating similar logic across DAGs — a real, meaningful production practice. **What to show:** the before (duplicated `PythonOperator` logic) and after (shared custom operator) versions side by side, with the operator's own code.
