# DBMS Advanced Concepts

## Database Architecture

### Storage Engine
- **Heap Files**: Unordered, simple append. Scans are slow.
- **B-Tree Files**: Data stored in B+ tree order. Fast range queries.
- **LSM Tree**: Log-Structured Merge tree. Used by Cassandra, RocksDB. Optimized for writes.

### Buffer Pool Management
- Pages cached in memory buffer pool.
- **LRU replacement policy**: Evict least recently used page.
- **Pin/Unpin**: Pages pinned in memory while in use.
- **Dirty pages**: Modified pages must be flushed to disk.

### Write-Ahead Logging (WAL)
Before modifying data, write the change to a log. Enables:
- **Redo**: Re-apply changes after crash.
- **Undo**: Roll back uncommitted transactions.
- **Checkpoint**: Flush dirty pages and record checkpoint in log.

## Advanced Concurrency

### Timestamp Ordering
Each transaction gets a timestamp. Reads/writes must respect timestamp order to avoid conflicts.

### Optimistic Concurrency Control
1. Read phase: Read data without locks.
2. Validation phase: Check for conflicts.
3. Write phase: Apply if no conflicts, else abort.

Useful when conflicts are rare (read-heavy workloads).

### Multi-Version Concurrency Control (MVCC)
- Each write creates a new version.
- Readers see a consistent snapshot.
- Writers don't block readers.
- PostgreSQL, MySQL InnoDB use MVCC.

## Distributed Databases

### Sharding
Partition data across multiple nodes.
- **Horizontal sharding**: Split rows across nodes.
- **Vertical sharding**: Split columns/tables across nodes.
- **Hash sharding**: Hash of key determines shard.
- **Range sharding**: Key ranges map to shards.

### Replication
- **Master-Slave**: Writes to master, reads from slaves.
- **Multi-Master**: Writes to any node, conflict resolution needed.
- **Synchronous**: Wait for all replicas to confirm write.
- **Asynchronous**: Write to primary, replicate in background.

### Distributed Transactions

**Two-Phase Commit (2PC)**:
1. Prepare phase: Coordinator asks all nodes to prepare.
2. Commit phase: If all prepared, coordinator sends commit.
Problem: Coordinator failure leaves system in uncertain state.

**Three-Phase Commit (3PC)**:
Adds a pre-commit phase to reduce blocking.

**Saga Pattern**:
Break distributed transaction into local transactions with compensating transactions for rollback.

## Query Optimization — Advanced

### Statistics and Cardinality Estimation
```sql
-- Update statistics
ANALYZE table_name;

-- Check table statistics
SELECT reltuples, relpages FROM pg_class WHERE relname = 'orders';
```

### Adaptive Query Processing
Modern databases adapt query plans at runtime based on actual intermediate results.

### Partition Pruning
```sql
CREATE TABLE orders (order_date DATE, amount DECIMAL)
PARTITION BY RANGE (order_date);

-- Query only scans relevant partition
SELECT * FROM orders WHERE order_date >= '2024-01-01';
```

## Column-Oriented Databases

### Row vs Column Storage
- **Row store** (OLTP): Good for point queries, updates.
- **Column store** (OLAP): Good for aggregate queries over many rows.

### Compression
Column stores compress well because same data type per column:
- Run-length encoding, dictionary encoding, bit packing.

### Vectorized Execution
Process batches (vectors) of rows at a time instead of one row at a time. Reduces function call overhead, enables SIMD.

## Graph Databases

### Property Graph Model
- Nodes (entities) and Edges (relationships) with properties.
- Query with Cypher (Neo4j) or Gremlin.

```cypher
MATCH (p:Person)-[:FRIENDS_WITH]->(f:Person)
WHERE p.name = 'Alice'
RETURN f.name
```

### Use Cases
- Social networks, recommendation engines, fraud detection, knowledge graphs.

## Time-Series Databases

### Optimizations for Time-Series
- Automatic partitioning by time.
- Downsampling and retention policies.
- Specialized compression for sequential timestamps.
- Examples: InfluxDB, TimescaleDB, Prometheus.
