# Cassandra Infrastructure Advanced Topics

## Cluster Sizing and Capacity Planning

```
SIZING FORMULA:
  Nodes needed = (Total data size × Replication Factor) / (Disk per node × Target utilisation)
  
  Example:
    Total data: 10TB | RF=3 | Disk per node: 2TB | Target: 50% utilisation
    Nodes = (10TB × 3) / (2TB × 0.5) = 30 / 1 = 30 nodes
  
  Rules of thumb:
    Target 50-60% disk utilisation (leave room for compaction)
    Heap: 8-16GB per node (more causes GC pressure)
    RAM: 2× heap minimum; 32-64GB per node ideal for in-memory tables
    CPU: 8-32 cores per node; IO-bound so more cores help less than IO speed
    SSDs: strongly preferred over HDDs for production

NODE CONFIGURATION (/etc/cassandra/cassandra.yaml):
  cluster_name: must be same across all nodes in cluster
  seeds: 2-3 seed nodes per datacenter (for bootstrapping new nodes)
  listen_address: node's IP (not 0.0.0.0)
  rpc_address: client connection IP
  endpoint_snitch: GossipingPropertyFileSnitch (recommended for production)
  num_tokens: 256 (default vnodes) — adjust for heterogeneous hardware
  compaction_throughput_mb_per_sec: 64 (throttle to not impact performance)
  concurrent_reads: 32 | concurrent_writes: 32 (tune per workload)

JVM SETTINGS:
  Heap: -Xms8G -Xmx8G (set equal to avoid resize pauses)
  G1GC recommended for heaps > 8GB
  -XX:+UseG1GC -XX:G1RHeapRegionSize=16m -XX:MaxGCPauseMillis=500
```

## Operations: Add/Remove Nodes

```bash
# Add a new node (auto-bootstraps by joining ring)
# 1. Configure cassandra.yaml: cluster_name, seeds, listen_address, dc/rack
# 2. Start Cassandra — it will bootstrap automatically
systemctl start cassandra
# 3. Monitor bootstrapping progress
nodetool netstats

# Check ring status after bootstrap
nodetool status  # should show UN (Up, Normal)

# Remove a node gracefully (decommission)
nodetool decommission  # run on the node to remove
# Node streams data to remaining nodes, then exits

# Force remove a dead node (when node is unreachable)
nodetool status  # find the Host ID of dead node (DN = Down, Normal leaving)
nodetool removenode <host-id>  # run on any live node

# Repair (ensure data consistency across replicas)
nodetool repair -pr  # repair primary ranges only (recommended)
nodetool repair myKeyspace myTable  # specific table
# Schedule full repair weekly; incremental repair (default in 4.x) is lighter
```

## Performance Tuning

```bash
# Key nodetool commands for performance
nodetool tablestats myKeyspace.myTable    # read/write latency, bloom filter efficiency
nodetool tpstats                          # thread pool statistics (dropped messages = backpressure)
nodetool compactionstats                  # pending compaction tasks
nodetool gcstats                          # GC pause duration and frequency

# Flush memtables to disk (before maintenance)
nodetool flush myKeyspace myTable

# Force compaction (expensive, avoid on busy cluster)
nodetool compact myKeyspace myTable

# Check for slow queries (cassandra.yaml)
slow_query_log_timeout_in_ms: 500  # log queries taking > 500ms

# Compression (per table DDL)
CREATE TABLE my_table (...) WITH compression = {
  'class': 'LZ4Compressor',      -- fast, good ratio
  'chunk_length_in_kb': 64
};
-- Alternative: ZstdCompressor (better ratio, more CPU), Snappy

# Bloom filter sizing
ALTER TABLE my_table WITH bloom_filter_fp_chance = 0.01;  -- 1% false positive
-- Lower = more memory usage but fewer disk reads for missing keys
```

## Backup and Recovery

```bash
# Snapshot (point-in-time backup)
nodetool snapshot --tag my_snapshot_20250624 myKeyspace

# List snapshots
nodetool listsnapshots

# Clear old snapshots (they don't auto-delete, consume disk space)
nodetool clearsnapshot --tag my_snapshot_20250624

# Backup location: /var/lib/cassandra/data/<keyspace>/<table>/snapshots/<tag>/
# Copy to remote storage (S3, NFS, etc.)
aws s3 sync /var/lib/cassandra/data/myKeyspace s3://my-cassandra-backup/

# Restore: copy sstables back, then run nodetool refresh
cp /backup/*.db /var/lib/cassandra/data/myKeyspace/myTable-<uuid>/
nodetool refresh myKeyspace myTable

# Schema backup
cqlsh -e "DESCRIBE FULL SCHEMA" > schema_backup.cql
```

## Study Resources
- **DataStax Academy Operations course** — free, hands-on cluster management
- **Cassandra Hardware Best Practices** (cassandra.apache.org) — official sizing guide
- **Netflix Tech Blog** — Cassandra at scale operational insights
- **Awesome Cassandra** (github.com/Anant/awesome-cassandra) — curated resources
