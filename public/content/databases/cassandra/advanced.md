# Cassandra — Advanced

## Compaction Strategies

```sql
-- SizeTieredCompactionStrategy (STCS) - default
-- Good for: write-heavy, infrequent reads
-- Merges same-sized SSTables when there are 4+ of them
ALTER TABLE events WITH compaction = {
    'class': 'SizeTieredCompactionStrategy',
    'min_threshold': 4,
    'max_threshold': 32
};

-- LeveledCompactionStrategy (LCS) - read-optimized
-- Maintains 10x size ratio between levels
-- Good for: read-heavy, many small updates
-- Trade-off: more I/O for compaction
ALTER TABLE user_profiles WITH compaction = {
    'class': 'LeveledCompactionStrategy',
    'sstable_size_in_mb': 160
};

-- TimeWindowCompactionStrategy (TWCS) - time-series data
-- Compacts data within same time window together
-- Perfect for time-series + TTL combination
ALTER TABLE metrics WITH compaction = {
    'class': 'TimeWindowCompactionStrategy',
    'compaction_window_unit': 'HOURS',
    'compaction_window_size': 1
} AND default_time_to_live = 86400;  -- Keep 24 hours
```
