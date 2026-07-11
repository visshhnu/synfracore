# dbt — Advanced

## Slim CI: only running/testing what actually changed

Running the entire project's models and tests on every pull request becomes impractically slow once a project reaches real size (hundreds of models) — dbt's state-based selection runs only what a PR's changes could actually affect:

```bash
# Compare against the last known-good production state, run only
# modified models and everything downstream of them
dbt build --select state:modified+ --state ./prod-run-artifacts
```
`state:modified+` selects models that changed in this PR, plus everything downstream of them (the `+` suffix) — a PR touching one staging model triggers a rebuild of that model and everything depending on it, but leaves the rest of the (potentially hundreds of models in a) project untouched. This is a genuinely significant CI time and cost reduction for large projects, and it depends on having a reliable, current "known-good state" artifact from production to compare against — typically produced by uploading the manifest from the last successful production run to somewhere CI can retrieve it before each PR run.

## Exposures: making downstream consumers first-class, not invisible

```yaml
# models/marts/exposures.yml
exposures:
  - name: executive_revenue_dashboard
    type: dashboard
    maturity: high
    url: https://bi-tool.example.com/dashboards/revenue
    depends_on:
      - ref('fct_orders')
    owner:
      name: Analytics Team
      email: analytics@example.com
```
An exposure declares that something outside dbt (a BI dashboard, a downstream ML pipeline, a reverse-ETL sync) depends on specific models — without this, a model's actual downstream consumers are invisible to dbt and to anyone reviewing a proposed schema change. With exposures declared, the lineage graph extends past dbt's own models to show real business impact: "changing this column would break the executive revenue dashboard" becomes a visible, documented fact in the lineage graph rather than tribal knowledge that only the one person who built that dashboard happens to remember.

## Performance at real warehouse scale: beyond incremental models

For genuinely large warehouses, a few techniques beyond basic incremental materialization matter:

- **Clustering/partitioning keys** — configuring a model's underlying table to be physically partitioned by a commonly-filtered column (a date, for BigQuery/Snowflake) so queries filtering on that column scan dramatically less data, both in dbt's own incremental runs and in downstream BI queries
- **`dbt run --select` for targeted rebuilds** — during active development, rebuilding only the specific model being worked on and its direct dependents (`dbt run --select my_model+`), not the entire project, to keep the local development iteration loop fast
- **Materialized views** (where the warehouse supports them, e.g. Snowflake, BigQuery) — for a query pattern that needs to always reflect current data with minimal latency but is too expensive to fully recompute on every dbt run, a warehouse-native materialized view can be the right choice over a dbt `table` or `incremental` model, trading some of dbt's own orchestration control for the warehouse's own automatic incremental maintenance

The general principle: incremental models solve the "don't reprocess unchanged historical data" problem, but genuinely large-scale performance also depends on physical data layout (partitioning/clustering) and matching materialization strategy to the query pattern actually being served — treating "add `materialized='incremental'`" as a universal performance fix without also considering these misses real, available further optimization.

## dbt Cloud vs. dbt Core: the actual tradeoff

dbt Core is the open-source CLI tool — free, runs anywhere you can run Python, requires you to build your own orchestration (a scheduler, CI/CD integration, a documentation hosting solution). dbt Cloud is the managed commercial offering — a hosted scheduler, built-in CI integration, hosted docs, and a web IDE, at real licensing cost. The practical decision point isn't "which is more powerful" (both run the same dbt project and models identically) — it's whether the operational overhead of self-hosting scheduling, CI integration, and docs hosting for dbt Core is worth avoiding for a given team's size and existing infrastructure. A team already deeply invested in a general-purpose orchestrator (Airflow, Dagster) that would run dbt Core as one more scheduled job often finds dbt Core the more natural fit, since they already have the orchestration infrastructure; a team without existing orchestration infrastructure often finds dbt Cloud's managed scheduling a faster path to a working production pipeline without building that infrastructure themselves first.

## Testing strategy at scale: not every model needs every test

A mature dbt project develops explicit testing priorities rather than mechanically adding every possible test to every model, which becomes real ongoing CI runtime cost without proportional value: primary-key uniqueness/not-null tests on every model that has one (cheap, catches a broad class of real bugs), `relationships` tests specifically at genuine join boundaries between marts (catches referential integrity breaks, which are a common and severe class of bug), and singular business-logic tests reserved for models where a specific, previously-encountered real bug justifies a permanent regression test. Testing every column of every model with every possible generic test uniformly, regardless of actual risk, is a common overcorrection that slows CI meaningfully without a corresponding increase in caught real bugs — test coverage should be prioritized by where data quality issues would actually cause real business harm, not applied uniformly by default.
