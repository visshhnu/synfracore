export const runtime = "edge";

export type LabStep = {
  id: string;
  title: string;
  description: string;
  type: "info" | "command" | "code" | "sql" | "verify" | "challenge";
  language?: string;
  code?: string;
  expectedOutput?: string;
  hint?: string;
  explanation?: string;
};

export type Lab = {
  id: string;
  title: string;
  difficulty: "Beginner" | "Intermediate" | "Advanced";
  duration: string;
  tools: string[];
  objective: string;
  steps: LabStep[];
  interface?: "terminal" | "code-editor" | "sql-console" | "none";
};

export type TechLabs = {
  [techSlug: string]: Lab[];
};

export const labs_databases: TechLabs = {
"postgresql": [
  {
    id: "pg-lab-1",
    title: "PostgreSQL Essentials: Schema and CRUD",
    difficulty: "Beginner",
    duration: "25 min",
    tools: ["psql", "PostgreSQL"],
    objective: "Design a database schema, insert data, and write queries including JOINs",
    interface: "sql-console",
    steps: [
      {
        id: "pg1-1", title: "Create schema", type: "sql",
        description: "Design and create a simple e-commerce database schema.",
        language: "sql",
        code: `-- Create tables with proper constraints and indexes
CREATE TABLE users (
    id          BIGSERIAL PRIMARY KEY,
    email       TEXT UNIQUE NOT NULL,
    name        TEXT NOT NULL,
    plan        TEXT NOT NULL DEFAULT 'free' CHECK (plan IN ('free', 'pro', 'enterprise')),
    created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE products (
    id          BIGSERIAL PRIMARY KEY,
    name        TEXT NOT NULL,
    price       NUMERIC(10,2) NOT NULL CHECK (price > 0),
    category    TEXT NOT NULL,
    stock       INTEGER NOT NULL DEFAULT 0 CHECK (stock >= 0)
);

CREATE TABLE orders (
    id          BIGSERIAL PRIMARY KEY,
    user_id     BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    total       NUMERIC(12,2) NOT NULL,
    status      TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending','paid','shipped','delivered','cancelled')),
    created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE order_items (
    id          BIGSERIAL PRIMARY KEY,
    order_id    BIGINT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    product_id  BIGINT NOT NULL REFERENCES products(id),
    quantity    INTEGER NOT NULL CHECK (quantity > 0),
    price_each  NUMERIC(10,2) NOT NULL
);

-- Indexes for common queries
CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);`,
        explanation: "BIGSERIAL = auto-incrementing bigint. TIMESTAMPTZ stores timezone info — always use this over TIMESTAMP. CHECK constraints enforce business rules at database level.",
      },
      {
        id: "pg1-2", title: "Insert sample data", type: "sql",
        description: "Populate the tables with realistic test data.",
        language: "sql",
        code: `-- Insert users
INSERT INTO users (email, name, plan) VALUES
    ('alice@example.com', 'Alice Johnson', 'enterprise'),
    ('bob@example.com',   'Bob Smith',    'pro'),
    ('charlie@example.com','Charlie Lee', 'free'),
    ('diana@example.com', 'Diana Kumar',  'pro'),
    ('eve@example.com',   'Eve Patel',    'enterprise');

-- Insert products
INSERT INTO products (name, price, category, stock) VALUES
    ('Laptop Pro',       89999, 'Electronics', 50),
    ('Wireless Mouse',    2499, 'Electronics', 200),
    ('Desk Lamp',         1299, 'Furniture',   75),
    ('Notebook Pack',      499, 'Stationery',  500),
    ('Coffee Maker',     6999, 'Kitchen',     30),
    ('Mechanical Keyboard', 7999, 'Electronics', 100);

-- Insert orders with items
INSERT INTO orders (user_id, total, status) VALUES (1, 92498, 'delivered');
INSERT INTO order_items (order_id, product_id, quantity, price_each) VALUES
    (1, 1, 1, 89999),   -- 1 Laptop
    (1, 2, 1, 2499);    -- 1 Mouse

INSERT INTO orders (user_id, total, status) VALUES (2, 9298, 'shipped');
INSERT INTO order_items (order_id, product_id, quantity, price_each) VALUES
    (2, 5, 1, 6999),    -- 1 Coffee Maker
    (2, 4, 5, 499);     -- 5 Notebook Packs

INSERT INTO orders (user_id, total, status) VALUES (1, 7999, 'pending');
INSERT INTO order_items (order_id, product_id, quantity, price_each) VALUES
    (3, 6, 1, 7999);    -- 1 Keyboard`,
      },
      {
        id: "pg1-3", title: "Query with JOINs", type: "sql",
        description: "Write queries that combine data from multiple tables.",
        language: "sql",
        code: `-- All orders with customer name and order details
SELECT
    u.name              AS customer,
    o.id                AS order_id,
    o.status,
    o.total,
    o.created_at::date  AS order_date
FROM orders o
JOIN users u ON o.user_id = u.id
ORDER BY o.created_at DESC;

-- Product breakdown per order
SELECT
    o.id    AS order_id,
    u.name  AS customer,
    p.name  AS product,
    oi.quantity,
    oi.price_each,
    oi.quantity * oi.price_each AS line_total
FROM order_items oi
JOIN orders o    ON oi.order_id = o.id
JOIN users u     ON o.user_id = u.id
JOIN products p  ON oi.product_id = p.id
ORDER BY o.id, line_total DESC;

-- Customer summary: orders, total spend
SELECT
    u.name,
    u.plan,
    COUNT(o.id)         AS total_orders,
    SUM(o.total)        AS total_spent,
    AVG(o.total)        AS avg_order_value,
    MAX(o.created_at)   AS last_order
FROM users u
LEFT JOIN orders o ON u.id = o.user_id   -- Include users with no orders
GROUP BY u.id, u.name, u.plan
ORDER BY total_spent DESC NULLS LAST;`,
        explanation: "LEFT JOIN keeps all rows from the left table even without matches. NULLS LAST sorts NULL values to the bottom. Always alias columns for readability.",
      },
      {
        id: "pg1-4", title: "Window functions", type: "sql",
        description: "Powerful analytics without GROUP BY collapsing rows.",
        language: "sql",
        code: `-- Rank products by revenue within each category
SELECT
    p.name,
    p.category,
    p.price,
    SUM(oi.quantity * oi.price_each) AS total_revenue,
    RANK() OVER (
        PARTITION BY p.category
        ORDER BY SUM(oi.quantity * oi.price_each) DESC
    ) AS rank_in_category,
    SUM(SUM(oi.quantity * oi.price_each)) OVER (
        PARTITION BY p.category
    ) AS category_total
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.id, p.name, p.category, p.price
ORDER BY p.category, rank_in_category;`,
        explanation: "PARTITION BY divides rows into groups (like GROUP BY but without collapsing). RANK() within each partition is independent. Window functions always follow OVER().",
      },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// SQL
// ═══════════════════════════════════════════════════════

"sql": [
  {
    id: "sql-lab-1",
    title: "SQL From Zero: SELECT, JOIN, Aggregate",
    difficulty: "Beginner",
    duration: "30 min",
    tools: ["SQL"],
    objective: "Master the core SQL operations used in 95% of real-world queries",
    interface: "sql-console",
    steps: [
      {
        id: "sql1-1", title: "Basic SELECT and filtering", type: "sql",
        description: "Retrieve specific columns and rows using WHERE conditions.",
        language: "sql",
        code: `-- Basic SELECT: choose columns from a table
SELECT id, email, name FROM users;

-- Filter with WHERE
SELECT * FROM users WHERE plan = 'enterprise';

-- Multiple conditions
SELECT * FROM orders
WHERE status = 'pending'
  AND total > 1000;

-- IN operator (instead of multiple OR conditions)
SELECT * FROM orders
WHERE status IN ('pending', 'paid');

-- Pattern matching (% = any chars, _ = one char)
SELECT * FROM users WHERE email LIKE '%@example.com';

-- NULL handling (use IS NULL, not = NULL)
SELECT * FROM products WHERE stock IS NOT NULL;
SELECT name, COALESCE(description, 'No description') FROM products;

-- Sorting and limiting
SELECT name, price FROM products
ORDER BY price DESC
LIMIT 3;`,
        explanation: "WHERE filters rows before they're returned. LIMIT is applied last. NULL is not equal to anything — always use IS NULL / IS NOT NULL.",
      },
      {
        id: "sql1-2", title: "Aggregate functions", type: "sql",
        description: "Summarize data with COUNT, SUM, AVG, MIN, MAX and GROUP BY.",
        language: "sql",
        code: `-- Count all orders
SELECT COUNT(*) AS total_orders FROM orders;

-- Average, total, min, max
SELECT
    COUNT(*)       AS orders,
    SUM(total)     AS revenue,
    AVG(total)     AS avg_order,
    MIN(total)     AS smallest,
    MAX(total)     AS largest
FROM orders
WHERE status != 'cancelled';

-- Group by category: revenue per category
SELECT
    p.category,
    COUNT(DISTINCT oi.order_id) AS num_orders,
    SUM(oi.quantity)            AS units_sold,
    SUM(oi.quantity * oi.price_each) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.category
ORDER BY revenue DESC;

-- HAVING: filter groups (not rows)
-- Find categories with more than 1 order
SELECT p.category, COUNT(DISTINCT oi.order_id) AS orders
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.category
HAVING COUNT(DISTINCT oi.order_id) > 1;`,
        hint: "WHERE filters rows before grouping. HAVING filters groups after grouping. You can't use aggregate functions in WHERE.",
        explanation: "Query execution order: FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT. This order determines what you can reference where.",
      },
    ],
  },
],

// ═══════════════════════════════════════════════════════
// JAVA
// ═══════════════════════════════════════════════════════

"mysql": [
  { id: "mysql-lab-1", title: "MySQL: Schema Design and EXPLAIN", difficulty: "Intermediate", duration: "25 min",
    tools: ["mysql"], objective: "Design tables with proper indexes, write optimized queries, analyze with EXPLAIN",
    interface: "sql-console",
    steps: [
      { id: "my1", title: "Create optimized schema", type: "sql",
        description: "MySQL-specific schema with proper data types, indexes, and constraints.",
        language: "sql",
        code: `CREATE TABLE users (
    id         BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    email      VARCHAR(255) NOT NULL,
    name       VARCHAR(100) NOT NULL,
    status     ENUM('active','inactive') DEFAULT 'active',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_email (email),
    KEY idx_status_created (status, created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users (email, name) VALUES ('alice@example.com', 'Alice'), ('bob@example.com', 'Bob');
SELECT * FROM users;`,
        explanation: "Always use utf8mb4 (not utf8) for full Unicode + emoji. AUTO_INCREMENT for PKs. ON UPDATE CURRENT_TIMESTAMP auto-updates timestamps. Composite indexes: equality columns first." },
      { id: "my2", title: "EXPLAIN query analysis", type: "sql",
        description: "EXPLAIN reveals how MySQL executes queries — find missing indexes.",
        language: "sql",
        code: `-- This shows the execution plan
EXPLAIN SELECT * FROM users WHERE status = 'active' ORDER BY created_at DESC LIMIT 10;
-- type=range or ref = good (index used)
-- type=ALL = bad (full table scan)
-- key=NULL = no index used!

-- Slow query log
-- SET GLOBAL slow_query_log = 1;
-- SET GLOBAL long_query_time = 1;

-- Show all indexes on a table
SHOW INDEX FROM users;`,
        explanation: "type=ALL means MySQL reads every row — dangerous on large tables. type=ref means index used. Extra='Using filesort' means extra sort step needed. Add indexes on frequently filtered/sorted columns." },
    ],
  },
],

// ═══ DATABASES: REDIS ═══

"redis": [
  { id: "redis-lab-1", title: "Redis: Caching, Rate Limiting, Pub/Sub", difficulty: "Intermediate", duration: "30 min",
    tools: ["redis-cli"], objective: "Implement cache-aside pattern, atomic rate limiter, and pub/sub",
    interface: "terminal",
    steps: [
      { id: "r1", title: "Explore all data types", type: "command",
        description: "Redis has 5 core data structures — each optimized for specific use cases.",
        code: `docker run -d --name redis -p 6379:6379 redis:7-alpine
redis-cli

SET user:1:name "Alice"
SETEX session:abc 3600 "user_data"
INCR page_views

HSET user:1 name "Alice" age 30
HGETALL user:1

RPUSH queue task1 task2 task3
LPOP queue

SADD tags python devops k8s
SMEMBERS tags

ZADD leaderboard 1500 alice 1200 bob
ZRANGE leaderboard 0 -1 WITHSCORES REV`,
        explanation: "String: counter/cache. Hash: object. List: queue. Set: unique tags. Sorted Set: leaderboard. Choose the right type — don't store everything as strings." },
      { id: "r2", title: "Cache-aside pattern in Python", type: "code",
        description: "The most common caching pattern: check cache first, miss → load DB → cache it.",
        language: "python",
        code: `import redis, json, time

r = redis.Redis(host='localhost', decode_responses=True)

def get_user(user_id: str) -> dict:
    cache_key = f"user:{user_id}"
    
    # 1. Check cache
    cached = r.get(cache_key)
    if cached:
        print(f"Cache HIT for {user_id}")
        return json.loads(cached)
    
    # 2. Cache miss: load from database (simulated)
    print(f"Cache MISS for {user_id} — loading from DB")
    time.sleep(0.1)  # Simulate DB query latency
    user = {"id": user_id, "name": "Alice", "email": "alice@example.com"}
    
    # 3. Store in cache with 5-minute TTL
    r.setex(cache_key, 300, json.dumps(user))
    return user

# Test
user = get_user("1")  # Cache MISS
user = get_user("1")  # Cache HIT (no DB query!)
print(r.ttl("user:1"), "seconds remaining")`,
        explanation: "Cache-aside: app manages the cache. Write-through: write to cache AND DB. Cache TTL prevents stale data. Cache invalidation (when data changes) is the hard part — delete cache key on update." },
    ],
  },
],

// ═══ DATABASES: MONGODB ═══

"mongodb": [
  { id: "mongo-lab-1", title: "MongoDB: Documents, Aggregation, Indexes", difficulty: "Intermediate", duration: "30 min",
    tools: ["mongosh"], objective: "Work with documents, run aggregation pipelines, optimize with indexes",
    interface: "terminal",
    steps: [
      { id: "mg1", title: "Insert and query documents", type: "command",
        description: "MongoDB stores flexible JSON documents — no rigid schema required.",
        code: `docker run -d --name mongodb -p 27017:27017 mongo:7
mongosh

use ecommerce

db.products.insertMany([
  { name: "Laptop", price: 89999, category: "Electronics", tags: ["portable","work"] },
  { name: "Mouse", price: 2499, category: "Electronics", specs: { dpi: 1600 } },
  { name: "Desk", price: 15999, category: "Furniture", adjustable: true }
])

// Query with filter
db.products.find({ category: "Electronics", price: { $lt: 50000 } })
db.products.find({ tags: "work" })           // Array contains
db.products.find({ "specs.dpi": { $gt: 1000 } })  // Nested field`,
        explanation: "Documents can have different fields — specs exists on Mouse, tags on Laptop. Query nested fields with dot notation. Array queries check if array CONTAINS the value." },
      { id: "mg2", title: "Aggregation pipeline", type: "command",
        description: "MongoDB aggregation is like SQL GROUP BY + JOINs, but more flexible.",
        code: `db.orders.aggregate([
  { $match: { status: "completed" } },
  { $group: {
      _id: "$category",
      revenue: { $sum: "$amount" },
      count: { $count: {} }
  }},
  { $sort: { revenue: -1 } },
  { $limit: 5 }
])

// Explain query for optimization
db.products.find({ category: "Electronics" }).explain("executionStats")
// Look for: "stage": "IXSCAN" (good) vs "COLLSCAN" (full scan, bad)

// Create index to fix COLLSCAN
db.products.createIndex({ category: 1, price: -1 })`,
        explanation: "COLLSCAN = full collection scan = slow. IXSCAN = index scan = fast. The aggregation stages run in order — match early to reduce documents. Always explain() slow queries." },
    ],
  },
],

// ═══ DATABASES: CASSANDRA ═══

"cassandra": [
  { id: "cass-lab-1", title: "Cassandra: Data Modeling and CQL", difficulty: "Intermediate", duration: "30 min",
    tools: ["cqlsh", "nodetool"], objective: "Design tables for your access patterns, insert data, write CQL queries",
    interface: "terminal",
    steps: [
      { id: "cas1", title: "Start Cassandra and connect", type: "command",
        description: "Start a single-node Cassandra for development practice.",
        code: `docker run -d --name cassandra -p 9042:9042 cassandra:4.1
sleep 30   # Wait for startup
cqlsh localhost 9042

CREATE KEYSPACE myapp WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};
USE myapp;

nodetool status    # Check cluster health (UN = Up/Normal)`,
        explanation: "Cassandra needs 30-60 seconds to start. Production uses NetworkTopologyStrategy with RF=3. nodetool is Cassandra's admin tool — like kubectl for K8s." },
      { id: "cas2", title: "Model tables around access patterns", type: "command",
        description: "In Cassandra, design the table around your queries — opposite of SQL normalization.",
        code: `-- Access pattern: "Get all messages in a conversation, newest first"
CREATE TABLE messages_by_conversation (
    conversation_id UUID,
    message_time    TIMESTAMP,
    message_id      UUID,
    sender_id       UUID,
    content         TEXT,
    PRIMARY KEY (conversation_id, message_time, message_id)
) WITH CLUSTERING ORDER BY (message_time DESC, message_id ASC)
  AND default_time_to_live = 2592000;   -- Auto-delete after 30 days

-- Insert and query
INSERT INTO messages_by_conversation (conversation_id, message_time, message_id, sender_id, content)
VALUES (uuid(), toTimestamp(now()), uuid(), uuid(), 'Hello!');

SELECT * FROM messages_by_conversation WHERE conversation_id = ? LIMIT 50;`,
        explanation: "Cassandra requires full partition key in WHERE clause. conversation_id is the partition key — all messages for a conversation go to one node. Denormalize heavily — no JOINs in Cassandra!" },
    ],
  },
],

// ═══ DATABASES: DYNAMODB ═══

"dynamodb": [
  { id: "ddb-lab-1", title: "DynamoDB: Single Table Design", difficulty: "Advanced", duration: "30 min",
    tools: ["aws-cli", "python"], objective: "Design a single-table DynamoDB schema that supports multiple access patterns",
    interface: "terminal",
    steps: [
      { id: "ddb1", title: "Create table and load data", type: "command",
        description: "DynamoDB single table design: ALL entities in ONE table using prefixed keys.",
        code: `# Create table with generic PK/SK
aws dynamodb create-table \
  --table-name AppTable \
  --attribute-definitions AttributeName=PK,AttributeType=S AttributeName=SK,AttributeType=S \
  --key-schema AttributeName=PK,KeyType=HASH AttributeName=SK,KeyType=RANGE \
  --billing-mode PAY_PER_REQUEST

# Insert user profile
aws dynamodb put-item --table-name AppTable --item '{"PK":{"S":"USER#alice"},"SK":{"S":"PROFILE"},"name":{"S":"Alice"},"email":{"S":"alice@example.com"}}'

# Insert user's order
aws dynamodb put-item --table-name AppTable --item '{"PK":{"S":"USER#alice"},"SK":{"S":"ORDER#2024-01-15#001"},"total":{"N":"1500"},"status":{"S":"paid"}}'

# Query: get all data for a user (profile + all orders in one request!)
aws dynamodb query --table-name AppTable --key-condition-expression "PK = :pk" --expression-attribute-values '{":pk":{"S":"USER#alice"}}'`,
        explanation: "Single table design: USER#alice as PK retrieves ALL user data in one query. SK prefixes separate entity types. This replaces SQL JOINs with a single highly-efficient DynamoDB query." },
    ],
  },
],

// ═══ DATABASES: ELASTICSEARCH ═══

"elasticsearch": [
  { id: "es-lab-1", title: "Elasticsearch: Search and Analytics", difficulty: "Intermediate", duration: "30 min",
    tools: ["elasticsearch", "curl"], objective: "Index documents, write search queries, create aggregations",
    interface: "terminal",
    steps: [
      { id: "es1", title: "Start Elasticsearch and index data", type: "command",
        description: "Start a single-node Elasticsearch and index some documents.",
        code: `docker run -d --name elasticsearch \
  -e "discovery.type=single-node" -e "xpack.security.enabled=false" \
  -p 9200:9200 elasticsearch:8.11.0

sleep 30
curl -s localhost:9200/_cluster/health?pretty

# Index documents
curl -X POST localhost:9200/products/_doc -H 'Content-Type: application/json' \
  -d '{"name":"Laptop Pro","price":89999,"category":"Electronics","in_stock":true}'
curl -X POST localhost:9200/products/_doc -H 'Content-Type: application/json' \
  -d '{"name":"Wireless Mouse","price":2499,"category":"Electronics","in_stock":true}'
curl -X POST localhost:9200/products/_doc -H 'Content-Type: application/json' \
  -d '{"name":"Standing Desk","price":24999,"category":"Furniture","in_stock":false}'
curl -X POST localhost:9200/products/_refresh`,
        explanation: "Elasticsearch is near-real-time: documents appear in search after 1-second refresh (configurable). Set refresh_interval=-1 during bulk indexing for better performance." },
      { id: "es2", title: "Search and aggregate", type: "command",
        description: "Full-text search, filters, and aggregations — the core Elasticsearch operations.",
        code: `# Full-text search
curl -X GET localhost:9200/products/_search -H 'Content-Type: application/json' -d '{
  "query": {"match": {"name": "wireless laptop"}}
}'

# Bool query: filter + full-text
curl -X GET localhost:9200/products/_search -H 'Content-Type: application/json' -d '{
  "query": {"bool": {
    "must": [{"match": {"category": "Electronics"}}],
    "filter": [{"range": {"price": {"lte": 50000}}}, {"term": {"in_stock": true}}]
  }},
  "sort": [{"price": "asc"}]
}'

# Aggregation: revenue by category
curl -X GET localhost:9200/products/_search -H 'Content-Type: application/json' -d '{
  "size": 0,
  "aggs": {"by_category": {"terms": {"field": "category.keyword"},
    "aggs": {"avg_price": {"avg": {"field": "price"}}}}}
}'`,
        explanation: "must: affects relevance score. filter: must match but no scoring (faster, cached). Use filter for exact matches (status, date, tags). Use must for full-text queries." },
    ],
  },
],

// ═══ DATABASES: ORACLE ═══

"oracle": [
  { id: "ora-lab-1", title: "Oracle PL/SQL Fundamentals", difficulty: "Advanced", duration: "35 min",
    tools: ["sqlplus", "oracle"], objective: "Write PL/SQL procedures, use cursors, handle exceptions",
    interface: "sql-console",
    steps: [
      { id: "ora1", title: "Create tables and PL/SQL block", type: "sql",
        description: "Oracle-specific: PL/SQL blocks, DUAL table, sequences, and DATE functions.",
        language: "sql",
        code: `-- Oracle-specific: use DUAL for expressions
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS') FROM DUAL;

-- Create sequence (Oracle's auto-increment)
CREATE SEQUENCE emp_seq START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE TABLE employees (
    id         NUMBER DEFAULT emp_seq.NEXTVAL PRIMARY KEY,
    name       VARCHAR2(100) NOT NULL,
    salary     NUMBER(10,2),
    dept       VARCHAR2(50),
    hire_date  DATE DEFAULT SYSDATE
);

INSERT INTO employees (name, salary, dept) VALUES ('Alice', 85000, 'Engineering');
INSERT INTO employees (name, salary, dept) VALUES ('Bob', 72000, 'Marketing');
COMMIT;

SELECT * FROM employees;`,
        explanation: "Oracle uses DUAL (dummy table) for expressions without a real table. Sequences replace MySQL's AUTO_INCREMENT. DATE in Oracle includes time. Always COMMIT after DML — Oracle doesn't auto-commit." },
      { id: "ora2", title: "Write a PL/SQL procedure", type: "sql",
        description: "PL/SQL adds procedural logic to SQL — variables, conditionals, loops, exceptions.",
        language: "sql",
        code: `-- PL/SQL anonymous block
SET SERVEROUTPUT ON;

DECLARE
    v_count    NUMBER;
    v_avg_sal  NUMBER;
BEGIN
    SELECT COUNT(*), AVG(salary)
    INTO v_count, v_avg_sal
    FROM employees;
    
    DBMS_OUTPUT.PUT_LINE('Employees: ' || v_count);
    DBMS_OUTPUT.PUT_LINE('Avg Salary: ' || ROUND(v_avg_sal, 2));
    
    IF v_avg_sal > 80000 THEN
        DBMS_OUTPUT.PUT_LINE('High salary company!');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/`,
        explanation: "PL/SQL blocks: DECLARE (variables), BEGIN (logic), EXCEPTION (error handling), END. SELECT INTO fetches one row — raises NO_DATA_FOUND if 0 rows, TOO_MANY_ROWS if multiple. WHEN OTHERS catches all other errors." },
    ],
  },
],

// ═══ AI: OPENAI LAB ═══
};

export function getLabsForTech(tech: string): Lab[] {
  return labs_databases[tech] || [];
}
