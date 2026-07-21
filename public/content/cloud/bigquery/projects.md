# BigQuery — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: Partitioned/Clustered Analytics Warehouse

**Level:** Beginner | **Time:** 2 days

Load a public or synthetic event dataset (e.g. clickstream, orders, or one of BigQuery's public datasets) into a properly partitioned and clustered table, then write a set of analytical queries against it and measure the bytes-scanned difference against an un-partitioned copy of the same data.

### Steps

1. Load raw data into an un-partitioned staging table with `bq load`
2. Design and create a target table: `PARTITION BY DATE(...)`, `CLUSTER BY` on your most commonly filtered columns
3. Backfill the partitioned table from staging with an `INSERT ... SELECT`
4. Write 3-5 realistic analytical queries (daily rollups, top-N, cohort-style joins)
5. Run each query against both the staging table and the partitioned/clustered table, and record bytes scanned for each (use dry run or `INFORMATION_SCHEMA.JOBS_BY_PROJECT`)
6. Document the before/after bytes-scanned comparison in your README — this is the actual point of the project

### Skills Demonstrated

- Partitioning and clustering design
- Query cost analysis
- BigQuery SQL

### GitHub Repo Name

`bigquery-partitioned-warehouse`

---

## Project 2: BigQuery ML Churn/Classification Model

**Level:** Intermediate | **Time:** 3 days

Build an end-to-end BigQuery ML pipeline entirely in SQL — no data ever leaves BigQuery. Train a classification model, evaluate it, and serve predictions back into a table a dashboard could read from.

### Steps

1. Assemble a labeled feature table (a public dataset with a binary outcome column, or synthetic data you generate)
2. Split into train/test (`data_split_method` or a manual `WHERE` split)
3. Train a model with `CREATE MODEL` (logistic regression is a reasonable first choice)
4. Evaluate with `ML.EVALUATE` and record precision/recall/AUC in your README
5. Generate predictions with `ML.PREDICT` into a results table
6. Set up a scheduled query to re-run predictions on new data on a cadence

### Skills Demonstrated

- BigQuery ML
- Model evaluation literacy
- SQL-only ML pipelines

### GitHub Repo Name

`bigquery-ml-classifier`

---

## Project 3: Cost-Governed Multi-Team Warehouse

**Level:** Advanced | **Time:** 5 days

Design a BigQuery setup for multiple teams sharing one project (or a few projects) — with cost control, access isolation, and monitoring, the way a real data platform team would run it.

### Steps

1. Design a dataset layout separating raw/staging/curated data, with clear ownership per dataset
2. Implement authorized views or row-level access policies so one team's data isn't visible to another by default
3. Set custom quotas / cost controls so a single runaway query can't blow the whole team's budget
4. Build a cost-monitoring query against `INFORMATION_SCHEMA.JOBS_BY_PROJECT` and turn it into a scheduled report or dashboard
5. Add materialized views for the 2-3 most expensive repeated queries you can identify
6. Document a runbook: what to do when a query is flagged as expensive before it runs (dry-run gate) and after (cost report)

### Skills Demonstrated

- Multi-tenant data governance
- Cost monitoring and control
- Materialized views and query optimization

### GitHub Repo Name

`bigquery-cost-governed-platform`

---

## Tips for Great Projects

**Make it real.** Solve an actual problem, even a small one. "Built a partitioned warehouse for my own Strava/finance/reading data and found a real cost-scanning bug" is more impressive than a tutorial clone.

**Document everything.** A repo with a great README beats one with better code but no explanation. Include: what it does, why you built it, how to run it, what you learned.

**Show your thinking.** In interviews, you'll be asked: "Why did you choose X over Y?" Have a reason. Architecture decisions matter.

**Iterate publicly.** Make commits regularly. Employers look at commit history. 10 commits over a week shows real work; 1 commit with everything shows you copied it.

## Portfolio Checklist

- [ ] 3+ projects on GitHub with clear READMEs  
- [ ] At least 1 project with CI/CD (GitHub Actions pipeline)
- [ ] At least 1 project that solves a real problem
- [ ] Each project has an architecture diagram
- [ ] Projects are pinned on your GitHub profile
