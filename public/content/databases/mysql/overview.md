# MySQL — The World's Most Popular Open Source Database

MySQL powers some of the largest websites on earth — Facebook, Twitter, YouTube, Wikipedia, and Shopify. It's the most deployed relational database, valued for its simplicity, performance, and massive ecosystem.

## MySQL vs PostgreSQL: When to Choose MySQL

**Choose MySQL when:**
- Your team knows MySQL and your stack is LAMP/LEMP
- Using managed services (AWS RDS MySQL, PlanetScale, Vitess)
- Need maximum read performance for simple queries
- Working with WordPress, Drupal, or other PHP applications
- Using MySQL-native tools like Percona Toolkit

**Choose PostgreSQL when:**
- You need advanced features (JSONB, full-text, window functions)
- Complex queries and analytics
- Strong ACID and consistency requirements
- Need extensions (PostGIS, pg_vector, TimescaleDB)

## Setup and Connect

```bash
# Start with Docker
docker run -d --name mysql \
    -e MYSQL_ROOT_PASSWORD=rootpass \
    -e MYSQL_DATABASE=myapp \
    -e MYSQL_USER=appuser \
    -e MYSQL_PASSWORD=apppass \
    -p 3306:3306 mysql:8.0

# Connect
mysql -h 127.0.0.1 -u appuser -p myapp
mysql -u root -p

# Useful commands
SHOW DATABASES;
USE myapp;
SHOW TABLES;
DESCRIBE users;
SHOW CREATE TABLE users\G
SHOW PROCESSLIST;
```

## Core Concepts

```sql
-- AUTO_INCREMENT (MySQL primary key)
CREATE TABLE users (
    id         BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    email      VARCHAR(255) NOT NULL,
    name       VARCHAR(100) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_email (email),
    INDEX idx_created (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Always use utf8mb4 (not utf8) — supports emoji and all Unicode
-- InnoDB engine is required for transactions and foreign keys
```
