# BigQuery — Learning Roadmap

## Estimated Time to Job-Ready
**5-7 weeks** of consistent learning (2-3 hours/day), assuming solid SQL fluency already — BigQuery's SQL dialect is approachable quickly for anyone comfortable with standard SQL; the real learning curve is in its serverless cost model, partitioning/clustering design, and query optimization for genuinely large datasets.

## Phase 1: Foundation (Week 1-2)

- Core architecture: no clusters to provision — you write SQL, BigQuery allocates however much compute the specific query needs behind the scenes, then releases it
- Datasets, tables, and BigQuery's columnar storage model, and why that column-oriented layout is what makes scanning billions of rows for a few columns fast
- Loading data (`bq load`, streaming inserts, external tables over Cloud Storage) and the real tradeoffs between batch loading and streaming
- Basic SQL against BigQuery specifically: standard SQL dialect, and the genuinely important distinction between it and BigQuery's older legacy SQL dialect still seen in older tutorials

**Checkpoint:** can you explain, in your own words, why BigQuery doesn't require you to provision a cluster size before running a query, unlike a traditional data warehouse?

## Phase 2: Cost Model and Query Optimization (Week 2-4)

- On-demand pricing (pay per byte scanned) vs. flat-rate/capacity-based pricing, and which workload profile actually justifies each
- Why `SELECT *` is a genuine cost problem in BigQuery specifically (not just a style issue) — every column scanned is billed, so selecting only needed columns directly reduces cost
- Partitioning (commonly by date) and clustering (by frequently-filtered columns) as the two primary levers for reducing bytes scanned on real queries
- Query cost estimation before running (the dry-run/bytes-processed estimate) as a habit for any query touching a large table

**Checkpoint:** given a query scanning a 500GB table with `SELECT *` and no date filter, can you explain two concrete changes that would reduce its actual cost, and why each one works?

## Phase 3: Advanced Querying and Data Modeling (Week 4-5)

- Nested and repeated fields (STRUCT and ARRAY types) as BigQuery's native way to represent hierarchical data without needing a separate join, and when this denormalized-by-design approach is actually the right call
- Window functions and analytical queries at scale — the same SQL concepts as any engine, but worth practicing specifically against BigQuery's actual performance characteristics on large tables
- Materialized views for pre-computing expensive, frequently-repeated aggregations
- BigQuery ML for running basic ML model training/prediction directly via SQL, without exporting data to a separate ML platform

**Checkpoint:** can you explain a real scenario where using a nested STRUCT/ARRAY field is a better design choice than a separate joined table in BigQuery specifically?

## Phase 4: Governance and Interview Readiness (Week 5-7)

- IAM at the project, dataset, and table level for controlling who can query, and the principle of least-privilege access to sensitive datasets
- Slot allocation and reservations for organizations using flat-rate pricing, and monitoring actual slot utilization
- Cost controls: custom quotas, budget alerts, and query cost estimation as an organizational discipline, not just an individual habit
- Review this course's Interview Q&A material, particularly the pricing-model and partitioning/clustering design questions

## Common Pitfalls Specific to BigQuery

- **Using `SELECT *` out of habit** — this is a direct, measurable cost problem in BigQuery's column-scan billing model, not just a style preference like it is in a traditional row-store database
- **Ignoring partitioning on large, date-heavy tables** — an unpartitioned table forces every query to scan the entire table's history even when only recent data is needed
- **Assuming flat-rate pricing is always cheaper** — it's only cost-effective at genuinely high, sustained query volume; on-demand is often cheaper for lighter or spikier usage
- **Treating BigQuery like a traditional normalized relational warehouse** — nested/repeated fields exist specifically because BigQuery's model rewards a different, more denormalized design in many cases

## Getting Your First BigQuery-Heavy Role

1. **Portfolio:** a project demonstrating a real partitioned/clustered table design with a documented before/after cost comparison (bytes scanned, not just query time)
2. **Resume:** be specific — "reduced monthly BigQuery spend 45% by partitioning a 2TB events table by date and clustering by user_id" is far stronger than "experience with BigQuery"
3. **Know the cost model cold:** BigQuery-specific interviews frequently probe cost-optimization reasoning, since it's one of the most practically important skills that differs from traditional SQL warehouse experience
4. **Certifications, if pursuing one:** BigQuery is central to Google Cloud's Professional Data Engineer certification — see this course's own Certification Guide for current format and pricing
