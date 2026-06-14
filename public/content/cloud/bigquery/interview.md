# BigQuery — Interview Questions

**What is BigQuery and how does it differ from traditional databases?**
BigQuery is a serverless, fully managed data warehouse. Key differences: columnar storage (great for analytics, poor for row-level updates), massively parallel processing (queries use thousands of CPUs automatically), serverless (no clusters/nodes to manage), pay-per-query (on-demand) or flat-rate (reservations), petabyte scale without configuration. Traditional databases (PostgreSQL, MySQL): row-oriented storage, manually scaled, transactional (OLTP), optimized for many small queries. BigQuery is OLAP (analytical), not suitable for high-frequency small transactional operations.

**How does BigQuery pricing work and how do you optimize costs?**
On-demand: $5 per TB scanned. Reservations (flat-rate): buy slots (units of compute), pay fixed price regardless of usage — better for predictable, heavy workloads. Cost optimization: partition tables (avoid scanning old partitions), cluster data (reduce bytes scanned within partition), SELECT only needed columns (not SELECT *), use previews and dry-run before executing, cache results (repeated identical queries are free), use materialized views for frequently-run aggregations, set custom quotas per project/user.

**What is the difference between partitioning and clustering in BigQuery?**
Partitioning: divides table into physical segments by date, timestamp, or integer range. Eliminates entire partitions from scan based on WHERE clause — if you filter by date, BQ only reads matching day(s). Clustering: sorts data within each partition by specified columns (up to 4). Further reduces bytes scanned by skipping row groups that don't match filter. Use both together: partition by date (coarse-grain), cluster by user_id/product_id (fine-grain). require_partition_filter option forces all queries to include a partition filter.
