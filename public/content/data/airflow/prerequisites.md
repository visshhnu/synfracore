# Apache Airflow — Prerequisites

Airflow is a workflow orchestrator, not a data processing engine itself — it schedules and monitors *other* tools (Spark jobs, SQL scripts, API calls) running in the right order. That framing matters for what you need to know first.

## What you need first

- **Solid Python** — Airflow DAGs (workflow definitions) are written in Python, and you'll write real Python logic (custom operators, sensors, branching conditions), not just declarative YAML. Comfortable functions, classes, and decorators are assumed.
- **Understanding of what the tools you're orchestrating actually do** — Airflow coordinates other systems (a Spark job, a dbt run, a database query, an API call); you need to understand those individual pieces before orchestrating them meaningfully. Airflow itself doesn't process data — it's the scheduler and dependency manager sitting above the tools that do.
- **Basic scheduling/cron concepts** — what a cron expression means, the difference between "run every hour" and "run once daily at 2am." Airflow's scheduling model builds on these concepts rather than replacing them entirely.
- **Comfort with the command line and basic Docker** — most modern Airflow deployments (including local learning setups) run via Docker Compose; basic Docker familiarity (starting/stopping containers, reading logs) is assumed.

## Helpful but not required

- **Prior experience with a different scheduler** (cron, a different workflow tool) — useful context for what problems Airflow solves, but not required; this page explains Airflow's specific model directly.
- **Kubernetes knowledge** — relevant if you're deploying Airflow itself on Kubernetes or using the KubernetesExecutor, but not needed to learn Airflow's core concepts, which this page teaches assuming a simpler local/Docker Compose setup first.

## A note on scope

This page teaches Airflow specifically — DAG authoring, scheduling, task dependencies, and operational patterns. It assumes you already know (or are learning separately) the actual data tools your DAGs will orchestrate — Airflow's own learning curve is entirely about *coordination*, not about teaching Spark, SQL, or any other specific data tool it might call.
