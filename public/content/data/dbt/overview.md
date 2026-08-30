# dbt (data build tool) Overview (Data Engineering)

**Before you start:** working SQL knowledge is assumed (SELECT, JOIN, WHERE). No prior dbt or software-engineering-tooling experience is needed.

## dbt in the Data Engineering Context

Before dbt, a typical analytics team's "transformation layer" was one enormous, undocumented SQL script (or a chain of them) that nobody fully understood, had no tests, and broke silently when an upstream source changed. dbt applies software-engineering discipline — version control, modularity, automated testing, documentation — to exactly this problem: a dbt project is a folder of small `.sql` files, each one a single `SELECT` statement, and dbt figures out the dependencies between them, runs them in the correct order, and can test the results automatically.

**Analogy** — Think of a dbt project like a spreadsheet where every cell's formula references another cell by name instead of a hardcoded value. If you change the formula in one cell, every cell that references it recalculates automatically and correctly — you never have to remember to manually update ten other cells by hand. A dbt model works the same way: instead of hardcoding another table's name, you write `ref('other_model')`, and dbt automatically figures out the correct build order and updates every downstream model when the referenced one changes — the dependency is tracked for you, not something you have to remember.

```
models/staging/stg_orders.sql   (references raw source data)
        │
        ▼  ref('stg_orders')
models/marts/fct_orders.sql     (built only after stg_orders succeeds)
```

## A Real dbt Model

```sql
-- models/staging/stg_orders.sql
SELECT
    order_id,
    customer_id,
    order_date,
    status,
    total_amount
FROM {{ source('raw', 'orders') }}
WHERE status != 'test_order'
```

```sql
-- models/marts/fct_orders.sql
SELECT
    o.order_id,
    o.customer_id,
    c.customer_name,
    o.total_amount
FROM {{ ref('stg_orders') }} o
JOIN {{ ref('stg_customers') }} c ON o.customer_id = c.customer_id
```

The two functions doing the real work are `source()` (marks where raw, dbt-external data enters) and `ref()` (references another dbt model by name, not by hardcoded table name). Because `fct_orders.sql` uses `ref('stg_orders')` instead of writing the literal table name, dbt automatically knows `stg_orders` must be built first, and if `stg_orders`'s underlying table name ever changes, every model that references it through `ref()` keeps working without any manual edits.

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "source()", "sublabel": "Raw data already in the warehouse, not built by dbt", "color": "blue" },
    { "label": "staging models", "sublabel": "Light cleaning, one model per source table", "color": "purple" },
    { "label": "mart models", "sublabel": "Business logic and joins, what BI tools query", "color": "green" }
  ]
}
```

## Why dbt Over Alternatives

```conceptgrid
{
  "boxes": [
    { "title": "One giant hand-written SQL script", "description": "No dependency tracking, no tests, no version control discipline -- dbt exists to replace exactly this pattern", "color": "amber" },
    { "title": "Stored procedures", "description": "Live inside the warehouse, hard to version-control and test the same way dbt's plain .sql files can be", "color": "purple" },
    { "title": "Full ETL tools (Informatica, etc.)", "description": "Broader scope (extract + load, not just transform), heavier, typically not code-first or git-native", "color": "blue" },
    { "title": "Airflow (separate tool)", "description": "Airflow orchestrates when things run across a whole pipeline; dbt handles the in-warehouse SQL transformation step specifically -- commonly used together", "color": "green" }
  ]
}
```

## Try It (2 Minutes)

dbt can run against a local DuckDB file with zero external warehouse setup:

```bash
pip install dbt-core dbt-duckdb
dbt init my_project   # choose "duckdb" as the adapter when prompted
cd my_project
dbt run   # builds the example models dbt scaffolds by default
```

1. After `dbt run` completes, open `target/run/` and note the models it built — dbt scaffolds two example models (`my_first_dbt_model`, `my_second_dbt_model`) so there's something to build immediately.
2. Open `models/example/my_second_dbt_model.sql` and find the `ref()` call referencing the first model — this is the exact mechanism from the `fct_orders`/`stg_orders` example above, just with dbt's own starter models.
3. Run `dbt test` — dbt runs the built-in tests defined in the scaffolded `schema.yml` and reports pass/fail, demonstrating the test-as-you-build workflow real dbt projects rely on.

## Study Resources
- **dbt official docs** (docs.getdbt.com) — authoritative, actively maintained
- **dbt Fundamentals course** (courses.getdbt.com) — free official course, hands-on
- **Analytics Engineering with dbt** — practical patterns beyond the basics
- **dbt Community Slack** — active, practitioner-heavy discussion and troubleshooting
