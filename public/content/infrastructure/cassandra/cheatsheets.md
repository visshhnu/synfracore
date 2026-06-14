# Cassandra — Cheatsheet









```bash\n# ── CQL SHELL ─────────────────────────────────────────────\ncqlsh\ncqlsh --username cassandra --password cassandra\n\n# ── KEYSPACES ─────────────────────────────────────────────\nDESCRIBE KEYSPACES;\nCREATE KEYSPACE myapp\nWITH replication = {'class': 'NetworkTopologyStrategy', 'dc1': 3};\nUSE myapp;\nDROP KEYSPACE myapp;\n\n# ── TABLES ────────────────────────────────────────────────\nDESCRIBE TABLES;\nDESCRIBE TABLE orders;\n\nCREATE TABLE orders (\n    user_id    UUID,\n    created_at TIMESTAMP,\n    order_id   UUID,\n    status     TEXT,\n    total      DECIMAL,\n    PRIMARY KEY (user_id, created_at)\n) WITH CLUSTERING ORDER BY (created_at DESC)\n   AND default_time_to_live = 7776000;  -- 90 days TTL\n\n# ── DML ───────────────────────────────────────────────────\nINSERT INTO orders (user_id, created_at, order_id, status)\nVALUES (uuid(), toTimestamp(now()), uuid(), 'pending');\n\nSELECT * FROM orders WHERE user_id = 550e8400-xxxx LIMIT 50;\n\nUPDATE orders SET status = 'paid' WHERE user_id = ? AND created_at = ?;\n\nDELETE FROM orders WHERE user_id = ? AND created_at = ?;\n\n# Lightweight transaction (serial consistency -- use sparingly)\nINSERT INTO users (email) VALUES ('alice@e.com') IF NOT EXISTS;\n\n# ── NODETOOL ──────────────────────────────────────────────\nnodetool status          # UN=Up Normal, DN=Down\nnodetool info            # Node stats\nnodetool cfstats         # Table-level stats\nnodetool repair          # Ensure replica consistency\nnodetool flush           # Flush memtables to SSTables\nnodetool compactionstats # Compaction progress\nnodetool describering myapp  # See ring token distribution\n\n# ── CONSISTENCY ───────────────────────────────────────────\nCONSISTENCY ONE;         # Fastest\nCONSISTENCY QUORUM;      # (RF/2)+1, balanced\nCONSISTENCY LOCAL_QUORUM;# Quorum within local DC\nCONSISTENCY ALL;         # All replicas must respond\n```
