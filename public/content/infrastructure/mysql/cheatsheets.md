# MySQL — Cheatsheet

```sql\n-- ── CONNECT ──────────────────────────────────────────────\nmysql -h host -u user -p\nmysql -u root -psecret mydb\n\n-- ── DATABASE & TABLE ────────────────────────────────────\nSHOW DATABASES;\nCREATE DATABASE myapp CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;\nUSE myapp;\nSHOW TABLES;\nDESCRIBE users;\nSHOW CREATE TABLE users\\G\n\n-- ── CRUD ─────────────────────────────────────────────────\nINSERT INTO users (email, name) VALUES ('alice@e.com', 'Alice');\nINSERT INTO users (email, name) VALUES ('bob@e.com', 'Bob'), ('charlie@e.com', 'Charlie');\nSELECT * FROM users WHERE email LIKE '%@gmail.com' LIMIT 10;\nUPDATE users SET name = 'Alice Smith' WHERE id = 1;\nDELETE FROM users WHERE created_at < DATE_SUB(NOW(), INTERVAL 1 YEAR);\n\n-- ── INDEXES ──────────────────────────────────────────────\nCREATE INDEX idx_email ON users(email);\nCREATE UNIQUE INDEX idx_unique_email ON users(email);\nCREATE INDEX idx_status_date ON orders(status, created_at DESC);\nSHOW INDEXES FROM users;\nDROP INDEX idx_email ON users;\n\n-- ── EXPLAIN ──────────────────────────────────────────────\nEXPLAIN SELECT * FROM orders WHERE user_id = 5;\nEXPLAIN FORMAT=JSON SELECT ...;\n-- type column: const/ref=good, range=ok, ALL=bad (full scan)\n\n-- ── JOINS ────────────────────────────────────────────────\nSELECT u.name, COUNT(o.id) orders FROM users u LEFT JOIN orders o ON u.id=o.user_id GROUP BY u.id;\n\n-- ── ADMIN ────────────────────────────────────────────────\nSHOW PROCESSLIST;\nKILL QUERY 123;\nSHOW STATUS LIKE 'Threads_connected';\nSHOW VARIABLES LIKE 'max_connections';\nSHOW ENGINE INNODB STATUS\\G\n\n-- ── BACKUP / RESTORE ─────────────────────────────────────\nmysqldump -u root -p myapp > backup.sql\nmysqldump -u root -p --all-databases > all_backup.sql\nmysql -u root -p myapp < backup.sql\n```








