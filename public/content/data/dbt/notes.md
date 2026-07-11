# dbt — Notes

## Core mental model

- A dbt model is a SQL `SELECT` statement; dbt handles materializing it and figuring out execution order via the dependency graph built from `ref()`/`source()` calls.
- `ref()` and `source()` are what turn a folder of SQL files into a real, traceable dependency graph — never hardcode a table name when `ref()`/`source()` can express the same dependency.
- `dbt build` (run + test together, in dependency order) is the right default over `dbt run` alone — catches a broken model immediately rather than letting it propagate downstream before anyone notices.

## Project structure

- Staging (light cleaning, one model per source) → Intermediate (shared reusable logic) → Marts (business logic, consumed by BI). A schema change ideally only requires fixing one staging model, not every downstream mart, specifically because everything downstream references staging via `ref()`.

## Materialization

- `view` for staging (cheap, always fresh); `table` for frequently-queried marts (worth the build cost); `incremental` once even `table` rebuilds become too slow.
- Defaulting every model to `table` "to be safe" wastes real warehouse compute rebuilding unchanged data.

## Incremental models

- `is_incremental()` is true only on runs against an already-existing table; `{{ this }}` refers to the model's own table.
- `unique_key` tells dbt how to merge (not just append) — missing or incorrect `unique_key` is the most common cause of silent duplicate-row accumulation in an incremental model.
- `dbt run --full-refresh` rebuilds from scratch, fixing accumulated duplicates, but can be expensive at scale — catching a bad `unique_key` at review time matters more than fixing it after the fact.

## Tests

- Generic tests (`unique`, `not_null`, `accepted_values`, `relationships`) are real SQL queries run against actual built data — this is what makes dbt a data quality gate, not just a SQL organizer.
- Singular tests are plain SQL files that should return zero rows if data is valid — the mechanism for encoding arbitrary business-logic assertions generic tests can't express.
- Test coverage should be prioritized by where data quality issues would cause real business harm — testing every column of every model uniformly is a common overcorrection that slows CI without proportional value.

## Macros, seeds, and lineage

- Macros exist to eliminate duplicated SQL logic — extract to a macro once a pattern appears in more than a couple of models, so a fix applies everywhere it's used, not just where it was manually copy-pasted.
- Seeds are for small, static, version-controlled reference data (a country code lookup) — not a substitute for real source data via `source()`.
- `dbt docs generate` produces an automatically-derived lineage graph from `ref()`/`source()` calls — never manually maintained, so it never drifts out of sync with the actual code, unlike a hand-drawn architecture diagram.

## Scale and operations

- Slim CI (`state:modified+`) runs only what a PR's changes could actually affect, compared against a known-good production state — essential once a project reaches real size (hundreds of models).
- Exposures make downstream consumers (dashboards, ML pipelines) visible in the lineage graph — without them, "what would break if I changed this" is invisible tribal knowledge.
- dbt Core (free, self-orchestrated) vs. dbt Cloud (managed, real licensing cost) is a tradeoff about who owns scheduling/CI/docs-hosting overhead, not a difference in dbt's core capability — teams with existing orchestration infrastructure (Airflow, Dagster) often prefer Core; teams without it often prefer Cloud's faster path to a working pipeline.
