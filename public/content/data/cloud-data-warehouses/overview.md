# Cloud Data Warehouses

## Why This Page Covers Multiple Vendors

A data engineer's real job is choosing and operating a data warehouse — not memorizing one vendor's SQL dialect. This page deliberately compares BigQuery, Redshift, Synapse, and Snowflake side by side, because that comparison is the actual skill; going deep on one vendor only makes sense once a project has already chosen its stack.

## The Landscape, Compared

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

Cloud data warehouses are typically the **destination** in an ELT pipeline: raw data lands via Airflow/Kafka → gets transformed with dbt → lands in the warehouse for BI tools (Power BI, Tableau, Looker) to query directly.

:::tip Vendor-specific deep dives
Once your project has picked a warehouse, going deep on that vendor's specific SQL dialect and performance tuning (e.g. BigQuery's `cloud/bigquery` page) is exactly the right next step — this page is the "which one, and why" step that should come first.
:::
