# dbt — Quick Reference

## Core CLI commands

```bash
dbt run                          # build all models
dbt test                         # run all tests
dbt build                        # run + test, in dependency order (recommended default)
dbt seed                         # load CSV seed files as tables
dbt docs generate && dbt docs serve   # generate + serve documentation/lineage

dbt run --select my_model        # build just one model
dbt run --select my_model+       # build the model + everything downstream of it
dbt run --select +my_model       # build the model + everything upstream of it
dbt run --full-refresh           # force a full rebuild of incremental models
```

## `ref()` and `source()`

```sql
{{ ref('stg_orders') }}                -- reference another dbt model
{{ source('raw', 'orders') }}          -- reference a raw source table (declared in sources.yml)
{{ this }}                             -- reference the current model's own table (used in incremental logic)
```

## Materializations

| Type | Behavior | Typical use |
|---|---|---|
| `view` | Recomputed on every query | Staging models — cheap, always fresh |
| `table` | Fully rebuilt every run | Marts queried repeatedly by BI |
| `incremental` | Only processes new/changed rows | Large fact tables |

## Incremental model pattern

```sql
{{ config(materialized='incremental', unique_key='order_id') }}

SELECT * FROM {{ source('raw', 'orders') }}
{% if is_incremental() %}
  WHERE updated_at > (SELECT max(updated_at) FROM {{ this }})
{% endif %}
```

## Tests

```yaml
# Generic tests (schema.yml)
models:
  - name: stg_orders
    columns:
      - name: order_id
        tests: [unique, not_null]
      - name: status
        tests:
          - accepted_values:
              values: ['pending', 'shipped', 'delivered']
      - name: customer_id
        tests:
          - relationships:
              to: ref('stg_customers')
              field: customer_id
```
```sql
-- Singular test (tests/assert_positive_totals.sql)
-- Fails if it returns any rows
SELECT order_id FROM {{ ref('fct_orders') }} WHERE total_amount < 0
```

## Project structure convention

```
models/
├── staging/       -- one model per source, light cleaning only
├── intermediate/  -- reusable logic shared across marts
└── marts/         -- business-logic models consumed by BI tools
```

## Slim CI (state-based selection)

```bash
dbt build --select state:modified+ --state ./prod-run-artifacts
```

## Macro example

```sql
{% macro cents_to_dollars(column_name) %}
    ({{ column_name }} / 100.0)
{% endmacro %}
```

## Troubleshooting quick checks

```bash
dbt ls --select +model_name+   # trace a model's full upstream/downstream deps
dbt source freshness           # check if source data is stale/schema drifted
dbt run --full-refresh --select model_name   # fix accumulated incremental duplicates
```
