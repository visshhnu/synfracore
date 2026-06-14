# Cassandra — Advanced

## Production Architecture and Performance

At the advanced level, you understand Cassandra internals, high-availability patterns, and production operations.









## Cassandra Architecture\n```\nCassandra uses consistent hashing to distribute data:\n- Each node is responsible for a range of hash values\n- Adding a node: cluster automatically rebalances\n- Replication factor: N copies of each row stored on N nodes\n- Consistency level: how many nodes must respond\n\nConsistency trade-offs:\n  QUORUM reads + QUORUM writes = strong consistency (majority of replicas)\n  ONE read + ONE write = fast, eventual consistency\n  ALL read + ALL write = strongest but unavailable if any node down\n\nnodetool status     # Cluster ring status (UN = Up/Normal)\nnodetool info       # Node metrics\nnodetool cfstats    # Table statistics\nnodetool repair     # Ensure replicas are in sync (run weekly)\nnodetool compact    # Merge SSTables (run after bulk deletes)\n```\n\n## Compaction Strategy\n```cql\n-- STCS (SizeTieredCompactionStrategy): default, good for write-heavy\n-- LCS (LeveledCompactionStrategy): good for read-heavy, more I/O\n-- TWCS (TimeWindowCompactionStrategy): best for time-series data\n\nALTER TABLE sensor_readings WITH compaction = {\n    'class': 'TimeWindowCompactionStrategy',\n    'compaction_window_size': '1',\n    'compaction_window_unit': 'DAYS'\n};\n```

## Production Checklist
- ✅ Replication configured (primary + at least 1 replica)
- ✅ Automated backups with tested restore
- ✅ Monitoring: connections, query time, replication lag
- ✅ Alerting: disk space, CPU, slow queries
- ✅ Connection pooling configured
- ✅ Regular maintenance scheduled (VACUUM, ANALYZE, REPAIR)
