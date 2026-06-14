# PostgreSQL — Cheatsheet







```bash\n# ── CONNECT ───────────────────────────────────────────────\npsql -h host -U user -d dbname\npsql -U postgres\n\\c mydb        # switch database\n\n# ── PSQL META-COMMANDS ────────────────────────────────────\n\\l             # list databases\n\\dt            # list tables\n\\d tablename   # describe table\n\\di            # list indexes\n\\dn            # list schemas\n\\df            # list functions\n\\x             # expanded output (vertical)\n\\timing        # show query execution time\n\\e             # open editor for query\n\\copy (SELECT ...) TO 'file.csv' CSV HEADER\n\n# ── KEY SQL ───────────────────────────────────────────────\n```\n```sql\n-- Create table\nCREATE TABLE users (\n    id         BIGSERIAL PRIMARY KEY,\n    email      TEXT UNIQUE NOT NULL,\n    name       TEXT NOT NULL,\n    data       JSONB,\n    created_at TIMESTAMPTZ DEFAULT NOW()\n);\n\n-- Upsert (PostgreSQL 9.5+)\nINSERT INTO users (email, name) VALUES ('alice@e.com', 'Alice')\nON CONFLICT (email) DO UPDATE SET name = EXCLUDED.name;\n\n-- JSONB queries\nSELECT data->'address'->'city' FROM users WHERE data->>'country' = 'IN';\n\n-- Window function\nSELECT name, salary,\n    RANK() OVER (PARTITION BY dept ORDER BY salary DESC) AS rank\nFROM employees;\n\n-- CTE\nWITH top_users AS (SELECT user_id, SUM(total) rev FROM orders GROUP BY 1 HAVING SUM(total)>1000)\nSELECT u.name, t.rev FROM users u JOIN top_users t ON u.id = t.user_id;\n\n-- EXPLAIN ANALYZE\nEXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT)\nSELECT * FROM orders WHERE user_id = 5;\n```\n```bash\n# ── BACKUP / RESTORE ─────────────────────────────────────\npg_dump -U postgres mydb > backup.sql\npg_dump -U postgres -Fc mydb > backup.dump   # custom format (faster restore)\npg_restore -U postgres -d mydb backup.dump\npg_dumpall -U postgres > all_databases.sql\n\n# ── MONITORING ────────────────────────────────────────────\npsql -c "SELECT query, calls, total_exec_time/calls avg_ms FROM pg_stat_statements ORDER BY avg_ms DESC LIMIT 10;"\npsql -c "SELECT * FROM pg_stat_activity WHERE state = 'active';"\npsql -c "SELECT * FROM pg_locks WHERE NOT granted;"\n```


