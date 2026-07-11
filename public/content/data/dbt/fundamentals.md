# dbt — Fundamentals

## The core idea: SQL SELECT statements as version-controlled models

A dbt "model" is just a `.sql` file containing a `SELECT` statement — dbt handles turning that into a table or view in your warehouse, tracking dependencies between models, and running them in the correct order:

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
The two functions doing the real work here — `source()` and `ref()` — are what turns a folder of SQL files into a genuine dependency graph. `source()` marks where raw data enters (a table dbt didn't create), and `ref()` references another dbt model by name rather than hardcoding its actual table name. This indirection is what lets dbt automatically figure out the correct execution order (`stg_orders` must run before `fct_orders`, since the latter references it) and what lets you rename the underlying table `stg_orders` builds without breaking every downstream model that references it — every reference updates automatically because they all go through `ref()`, not a hardcoded table name.

## Running your first project

```bash
# Install dbt-core plus the adapter for your specific warehouse
pip install dbt-core dbt-postgres   # or dbt-snowflake, dbt-bigquery, dbt-redshift

# Initialize a new project
dbt init my_project

# Run all models — builds them in dependency order automatically
dbt run

# Run tests defined on your models
dbt test

# Run and test in one command, in dependency order
dbt build
```
`dbt build` is generally the right default for local development and CI — it runs each model and then immediately tests it before moving to dependent models, so a broken model or failing test is caught immediately rather than propagating downstream and only being discovered after everything has already run.

## Project structure: staging, intermediate, marts

A dbt project's folder structure is a real convention worth following from day one, not just an organizational preference:

```
models/
├── staging/       — one model per source table, light cleaning only
│   └── stg_orders.sql
├── intermediate/  — reusable logic shared across multiple marts
│   └── int_orders_joined.sql
└── marts/         — final, business-logic models consumed by BI tools
    └── fct_orders.sql
```
Staging models do minimal transformation — renaming columns to a consistent convention, basic type casting, filtering out obviously invalid rows — and exist specifically as a stable interface between raw source data and everything downstream, so a raw source schema change only needs a fix in one staging model, not in every mart that ultimately depends on that source. Marts are where actual business logic and joins happen, structured around what a BI tool or analyst actually needs to query directly.

## Materializations: table, view, and why the choice matters

```sql
-- Set materialization per-model via config, or per-project as a default
{{ config(materialized='table') }}

SELECT ...
```
| Materialization | What it does | When to use |
|---|---|---|
| `view` | A SQL view — recomputed on every query | Default for staging models — cheap to build, always fresh |
| `table` | A physical table — rebuilt fully on every `dbt run` | Marts queried frequently by BI tools — trades build time for query speed |
| `incremental` | Only processes new/changed rows on each run | Large fact tables where a full rebuild is genuinely too slow |

Choosing `table` for every model "to be safe" wastes real warehouse compute rebuilding data that hasn't changed — the practical default is `view` for staging (cheap, always current) and `table` for marts that get queried repeatedly by a BI tool (worth the one-time build cost to avoid recomputing the same query logic on every dashboard load). Incremental materialization, covered in depth on the Intermediate tab, is the answer once even `table` materialization becomes too slow to fully rebuild on every run.

## Tests: the feature that makes dbt more than "SQL organized into files"

```yaml
# models/staging/schema.yml
models:
  - name: stg_orders
    columns:
      - name: order_id
        tests: [unique, not_null]
      - name: status
        tests:
          - accepted_values:
              values: ['pending', 'shipped', 'delivered', 'cancelled']
```
Built-in generic tests (`unique`, `not_null`, `accepted_values`, `relationships`) run as real SQL queries against the actual built data, failing the `dbt test`/`dbt build` run if a violation is found. This is what turns dbt from "a way to organize SQL transformations" into a real data quality gate — a broken upstream source (a new, unexpected status value appearing, a duplicate order_id from a source system bug) is caught automatically the next time the pipeline runs, rather than silently propagating incorrect data downstream into a dashboard where a stakeholder eventually notices something looks wrong, days later, with no clear trace back to the actual cause.
