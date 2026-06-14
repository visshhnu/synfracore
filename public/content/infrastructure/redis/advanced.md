# Redis — Advanced

## Production Architecture and Performance

At the advanced level, you understand Redis internals, high-availability patterns, and production operations.



## Redis Cluster\n```bash\n# Redis Cluster: auto-shards data across multiple nodes\n# 16384 hash slots distributed across master nodes\n\n# Create a 3-master, 3-replica cluster\nredis-cli --cluster create \\\n    127.0.0.1:7001 127.0.0.1:7002 127.0.0.1:7003 \\\n    127.0.0.1:7004 127.0.0.1:7005 127.0.0.1:7006 \\\n    --cluster-replicas 1\n\nredis-cli --cluster info 127.0.0.1:7001\nredis-cli --cluster check 127.0.0.1:7001\n```\n\n## Persistence\n```bash\n# RDB (snapshot): good for backups, may lose data since last snapshot\nsave 900 1    # Save if 1 key changed in 900 seconds\nsave 300 10   # Save if 10 keys changed in 300 seconds\n\n# AOF (Append Only File): log every write command, better durability\nappendonly yes\nappendfsync everysec  # Sync to disk every second (balance of safety/performance)\n\n# Best practice: enable both\n# RDB for fast restarts, AOF for minimal data loss\n```\n\n## Memory Management\n```bash\n# Set max memory and eviction policy\nmaxmemory 4gb\nmaxmemory-policy allkeys-lru  # Evict least recently used keys when full\n# Policies: noeviction, allkeys-lru, volatile-lru, allkeys-random\n\n# Memory analysis\nredis-cli memory doctor\nredis-cli --bigkeys\nredis-cli --memkeys\n```







## Production Checklist
- ✅ Replication configured (primary + at least 1 replica)
- ✅ Automated backups with tested restore
- ✅ Monitoring: connections, query time, replication lag
- ✅ Alerting: disk space, CPU, slow queries
- ✅ Connection pooling configured
- ✅ Regular maintenance scheduled (VACUUM, ANALYZE, REPAIR)
