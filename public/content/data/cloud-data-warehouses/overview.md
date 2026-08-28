# Cloud Data Warehouses

**Before you start:** basic SQL and the concept of a database table are assumed. [SQL Mastery](/academies/data/sql/overview) covers the query language itself — this page is about the infrastructure that runs those queries at much larger scale.

## Why This Exists (The Hook)

A traditional on-premises database server has a fixed amount of compute and storage bolted together — running out of either means buying and racking new hardware, a slow, expensive, all-or-nothing scaling decision. Cloud data warehouses exist because most analytical workloads don't need constant maximum capacity — they need to query terabytes occasionally and sit mostly idle otherwise. Separating storage from compute (a defining feature of every warehouse compared below) means you pay for storage cheaply all the time and pay for compute only during the seconds you're actually running a query.

**Analogy** — Think of a cloud data warehouse like a valet parking service, not owning a personal garage. A personal garage (an on-prem server) is sized once and sits there whether you're using it or not — upgrading means physically building a bigger garage. Valet parking scales instantly to however many cars show up, and you only pay for the valet's time when a car actually needs handling — that's the "pay for compute only when querying" model every warehouse in this comparison uses.

**Try it (2 minutes)** — Reason through why "partitioning & clustering" is described as "the single biggest lever for both cost and speed," without looking anything up: if a warehouse charges per query byte scanned, and a table has a `date` column, what happens to both the cost and the speed of a query filtered to "last 7 days" if the table is partitioned by date (so the warehouse only reads the relevant date partitions) versus not partitioned at all (so it must scan the entire table to find matching rows)?

## Why This Page Covers Multiple Vendors

A data engineer's real job is choosing and operating a data warehouse — not memorizing one vendor's SQL dialect. This page deliberately compares BigQuery, Redshift, Synapse, and Snowflake side by side, because that comparison is the actual skill; going deep on one vendor only makes sense once a project has already chosen its stack.

## The Landscape, Compared

```conceptgrid
{
  "boxes": [
    { "title": "BigQuery", "description": "Google Cloud -- serverless, fully managed, no cluster management", "color": "blue" },
    { "title": "Redshift", "description": "AWS -- cluster-based or serverless, deep AWS ecosystem integration", "color": "amber" },
    { "title": "Synapse Analytics", "description": "Azure -- combines data warehousing + big data in one service", "color": "purple" },
    { "title": "Snowflake", "description": "Multi-cloud -- true storage/compute separation, instant scaling", "color": "green" }
  ]
}
```

| Warehouse | Provider | Architecture | Standout feature |
|---|---|---|---|
| BigQuery | Google Cloud | Serverless, fully managed | No cluster management — pay per query/storage |
| Redshift | AWS | Cluster-based (or Serverless) | Deep AWS ecosystem integration |
| Synapse Analytics | Azure | Cluster-based + serverless SQL pools | Combines data warehousing + big data in one service |
| Snowflake | Multi-cloud (runs on AWS/Azure/GCP) | Separates storage & compute completely | True multi-cloud portability, instant compute scaling |

## Core Concepts That Apply Across All of Them

- **Columnar storage** — data warehouses store data by column, not row, making aggregate queries (SUM, AVG, GROUP BY) dramatically faster than row-based OLTP databases.
- **Separation of storage and compute** — most modern warehouses (Snowflake, BigQuery, Redshift Serverless) let you scale query compute independently from stored data volume, so you only pay for compute when actually querying.
- **Partitioning & clustering** — organizing large tables by date or key columns so queries scan less data — this is the single biggest lever for both cost and speed in every warehouse listed above.
- **Materialized views** — pre-computed query results that refresh incrementally, used to speed up dashboards hitting the same aggregations repeatedly.

## Choosing One

| If you need... | Consider |
|---|---|
| Already deep in GCP, want zero ops | BigQuery |
| Already deep in AWS ecosystem | Redshift |
| Already deep in Azure, want warehouse + big data together | Synapse |
| Multi-cloud portability, or not yet locked into one cloud | Snowflake |

## Cost Model Basics

- BigQuery/Snowflake/Redshift Serverless: pay primarily for **query bytes scanned** or **compute-seconds** + storage.
- Redshift (provisioned)/Synapse (dedicated pools): pay for **reserved cluster capacity**, running whether queried or not — cheaper at very high, constant utilization; wasteful at low/spiky usage.

## Where This Fits in a Data Pipeline

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Raw Data Lands", "sublabel": "Via Airflow / Kafka orchestration", "color": "blue" },
    { "label": "Transform (dbt)", "sublabel": "SQL-based transformation in the warehouse", "color": "purple" },
    { "label": "Cloud Data Warehouse", "sublabel": "Destination -- BigQuery/Redshift/Synapse/Snowflake", "color": "amber" },
    { "label": "BI Tools Query It", "sublabel": "Power BI, Tableau, Looker", "color": "green" }
  ]
}
```

Cloud data warehouses are typically the **destination** in an ELT pipeline: raw data lands via Airflow/Kafka → gets transformed with dbt → lands in the warehouse for BI tools (Power BI, Tableau, Looker) to query directly.

:::tip Vendor-specific deep dives
Once your project has picked a warehouse, going deep on that vendor's specific SQL dialect and performance tuning (e.g. BigQuery's `cloud/bigquery` page) is exactly the right next step — this page is the "which one, and why" step that should come first.
:::
