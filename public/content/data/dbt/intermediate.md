# dbt — Intermediate

## Incremental models: processing only what changed

Once a fact table is large enough that fully rebuilding it on every `dbt run` is genuinely too slow, incremental materialization processes only new or changed rows instead:

```sql
{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

SELECT
    order_id,
    customer_id,
    order_date,
    total_amount,
    updated_at
FROM {{ source('raw', 'orders') }}

{% if is_incremental() %}
  WHERE updated_at > (SELECT max(updated_at) FROM {{ this }})
{% endif %}
```
`is_incremental()` is a dbt macro that's only true on subsequent runs against an already-existing table — the first run builds the full table (the `WHERE` clause is skipped), and every run after that only selects rows newer than what's already in the table (`{{ this }}` refers to the model's own already-built table). The `unique_key` config tells dbt how to merge new rows in — updating existing rows that changed rather than blindly appending duplicates. Getting `unique_key` wrong (or omitting it when rows can genuinely be updated, not just inserted) is one of the most common incremental-model bugs, producing silent duplicate rows that don't show up as an error, just as slowly-growing incorrect data.

## Custom (singular) tests: beyond the built-in generic tests

Built-in tests (`unique`, `not_null`) cover common structural checks — a **singular test** is a plain SQL file that should return zero rows if data is valid, letting you express arbitrary business-logic assertions:

```sql
-- tests/assert_positive_order_totals.sql
-- Fails if this query returns any rows — order totals should never be negative
SELECT order_id, total_amount
FROM {{ ref('fct_orders') }}
WHERE total_amount < 0
```
This is the mechanism for encoding domain-specific business rules that generic tests can't express — "an order total should never be negative," "a customer's lifetime value should never exceed the sum of their individual order totals," or any other assertion specific to your actual data's business logic. Writing these tests as data quality issues are discovered (rather than only at initial model creation) is a genuinely valuable habit — each real data bug found becomes a permanent regression test preventing the same class of bug from silently recurring later.

## Macros and Jinja: reducing duplicated SQL logic

```sql
-- macros/cents_to_dollars.sql
{% macro cents_to_dollars(column_name) %}
    ({{ column_name }} / 100.0)
{% endmacro %}
```
```sql
-- used in any model
SELECT
    order_id,
    {{ cents_to_dollars('amount_cents') }} AS amount_dollars
FROM {{ ref('stg_orders') }}
```
A macro is dbt's mechanism for reusable SQL logic — if the same transformation pattern (a currency conversion, a standard date-truncation, a common CASE statement) appears in more than a couple of models, that's the signal to extract it into a macro rather than copy-pasting the same SQL repeatedly. The real payoff shows up when that logic needs to change — fixing a macro once updates every model using it, versus needing to find and correctly update every copy-pasted instance across the project, which is exactly the kind of drift-prone duplication macros exist to eliminate.

## Seeds: version-controlled reference data, directly in the project

```csv
# seeds/country_codes.csv
country_code,country_name
US,United States
IN,India
GB,United Kingdom
```
```bash
dbt seed   # loads the CSV into the warehouse as a real table
```
Seeds are for small, relatively static reference data that genuinely belongs in version control alongside the transformation logic that uses it — a country code lookup, a mapping of internal status codes to display names — rather than living in a spreadsheet somewhere disconnected from the pipeline, or being hardcoded as a `CASE` statement scattered across multiple models. Seeds are explicitly not the right tool for actual application data (which should come from a real source system via `source()`) — the distinguishing test is whether the data is genuinely static reference data maintained by the data team itself, versus operational data that originates elsewhere.

## Documentation and lineage: dbt docs generate

```bash
dbt docs generate   # builds a documentation site from your project + database metadata
dbt docs serve      # serves it locally
```
```yaml
models:
  - name: fct_orders
    description: "One row per order, joined with customer details."
    columns:
      - name: order_id
        description: "Primary key, unique per order."
```
The genuinely valuable output here isn't just readable docs — it's an automatically generated **lineage graph**, showing the full dependency chain from raw sources through every staging/intermediate/mart model, derived directly from the `ref()`/`source()` calls already in the project rather than manually maintained separately (and therefore never drifting out of sync with the actual code, unlike a hand-drawn architecture diagram). This is a direct, practical answer to "what would break if I changed this source table" — the lineage graph shows exactly which downstream models depend on it, which is otherwise a genuinely hard question to answer confidently in a large project without this tooling.
