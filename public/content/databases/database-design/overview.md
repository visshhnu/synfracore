# Database Design — Overview

**Before you start:** basic SQL (SELECT/WHERE/JOIN, CREATE TABLE) is assumed — see the SQL Mastery course first if that's new. No prior schema-design experience is required.

## What is Database Design?

Database design is the process of producing a detailed data model for a database. It determines what data gets stored, how it's organized, what relationships exist, and what constraints enforce data integrity.

## Why This Exists (The Hook)

A database with no design discipline still technically works at first — you can jam every field into one giant table and it'll return correct answers on small data. The problems show up later: the same customer's email duplicated across a thousand rows means updating it requires a thousand writes instead of one, and forgetting even one leaves the data silently inconsistent. Database design exists to catch these problems on paper, before they're baked into millions of production rows that are expensive and risky to restructure later.

**Analogy** — Think of database design like architectural blueprints for a building versus building it as you go. You *can* start construction without blueprints — walls go up, rooms get built — but you'll eventually discover a load-bearing wall in the wrong place, or a plumbing run that should have been planned before the concrete was poured. Normalization and ER diagrams are the blueprint phase: figuring out the structure on paper, where changes cost nothing, instead of discovering the problem after the data (the building) already exists.

**Try it (2 minutes)** — Reason through why storing `customer_name` and `customer_email` directly on every order row is a real problem, without running any SQL: if a customer places 50 orders and then changes their email address, how many rows does an unnormalized `orders` table need to update to keep that customer's email consistent everywhere? What happens if row #37 gets missed during that update — does the database have any way of knowing that's now a mistake?

---

## Normalization — The Foundation

### Normal Forms

```conceptgrid
{
  "boxes": [
    { "title": "1NF", "description": "Atomic values, no repeating groups -- eliminate arrays in columns", "color": "blue" },
    { "title": "2NF", "description": "1NF + no partial dependencies -- remove columns dependent on part of PK", "color": "purple" },
    { "title": "3NF", "description": "2NF + no transitive dependencies -- remove columns dependent on non-key columns", "color": "amber" },
    { "title": "BCNF", "description": "Stronger 3NF -- every determinant is a candidate key", "color": "green" }
  ]
}
```

| Form | Rule | Fixes |
|------|------|-------|
| 1NF | Atomic values, no repeating groups | Eliminate arrays in columns |
| 2NF | 1NF + no partial dependencies | Remove columns dependent on part of PK |
| 3NF | 2NF + no transitive dependencies | Remove columns dependent on non-key columns |
| BCNF | Stronger 3NF | Every determinant is a candidate key |
| 4NF | No multi-valued dependencies | Rare in practice |

### Example: Normalize an Order Table
```sql
-- Unnormalized (problematic)
orders: order_id, customer_name, customer_email, product1, product2, product3

-- 1NF: Atomic values
orders: order_id, customer_id, product_id (separate row per product)

-- 2NF: Separate customer data (not dependent on product)
customers: customer_id, customer_name, customer_email
orders: order_id, customer_id
order_items: order_id, product_id, quantity, price

-- 3NF: Product category not dependent on order_id
products: product_id, product_name, category_id, price
categories: category_id, category_name
```

---

## ER Diagram (Entity Relationship)

### Cardinality Types
```
One-to-One (1:1)
User ─── UserProfile (one user has exactly one profile)

One-to-Many (1:N)  ← most common
Customer ──< Orders (one customer has many orders)

Many-to-Many (M:N) ← requires junction table
Students >──< Courses (students take many courses, courses have many students)
→ Implement as: students, courses, enrollments(student_id, course_id, enrolled_date)
```

---

## Schema Patterns

### Star Schema (Data Warehousing)
```sql
-- Fact table: measurements/events
CREATE TABLE fact_sales (
    sale_id BIGINT PRIMARY KEY,
    date_key INT REFERENCES dim_date(date_key),
    product_key INT REFERENCES dim_product(product_key),
    customer_key INT REFERENCES dim_customer(customer_key),
    quantity INT,
    revenue DECIMAL(10,2),
    cost DECIMAL(10,2)
);

-- Dimension tables: descriptive attributes
CREATE TABLE dim_product (
    product_key INT PRIMARY KEY,
    product_name VARCHAR(200),
    category VARCHAR(100),
    brand VARCHAR(100)
);
```

### JSONB for Semi-Structured Data (PostgreSQL)
```sql
-- When schema varies per record
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    category VARCHAR(50),
    attributes JSONB  -- flexible: {"color":"red","size":"XL"} or {"voltage":"220V","watts":"60"}
);

-- Index JSONB for query performance
CREATE INDEX idx_products_attributes ON products USING GIN(attributes);

-- Query JSONB
SELECT * FROM products WHERE attributes->>'color' = 'red';
SELECT * FROM products WHERE attributes @> '{"size": "XL"}';
```

---

## Indexing Strategy

```sql
-- B-Tree index (default): equality and range queries
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_date ON orders(created_at DESC);

-- Composite index: column order matters!
-- Query: WHERE customer_id = ? AND status = ?
CREATE INDEX idx_orders_customer_status ON orders(customer_id, status);
-- customer_id must be first (most selective, equality predicate)

-- Partial index: index only relevant rows
CREATE INDEX idx_active_orders ON orders(created_at) 
WHERE status = 'active';  -- smaller index, faster for this common query

-- Covering index: include all columns needed by query (no table lookup)
CREATE INDEX idx_orders_covering ON orders(customer_id) 
INCLUDE (total_amount, status, created_at);
```

---

## Constraints for Data Integrity

```sql
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers(id) ON DELETE RESTRICT,
    status VARCHAR(20) NOT NULL CHECK (status IN ('pending','processing','shipped','delivered','cancelled')),
    total_amount DECIMAL(10,2) NOT NULL CHECK (total_amount >= 0),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    
    CONSTRAINT unique_customer_order UNIQUE (customer_id, order_id)
);
```

---

## CAP Theorem

```conceptgrid
{
  "boxes": [
    { "title": "Consistency", "description": "All nodes see the same data at the same time -- PostgreSQL, MySQL", "color": "blue" },
    { "title": "Availability", "description": "Every request gets a response -- Cassandra, DynamoDB", "color": "purple" },
    { "title": "Partition Tolerance", "description": "System works despite network splits -- required for any distributed system", "color": "green" }
  ]
}
```

| Guarantee | Meaning | Example |
|-----------|---------|---------|
| Consistency | All nodes see same data at same time | PostgreSQL, MySQL |
| Availability | Every request gets a response | Cassandra, DynamoDB |
| Partition Tolerance | System works despite network splits | (all distributed systems need this) |

**CAP says: pick 2.** In practice, P is required, so you choose between C and A:
- **CP** (consistent + partition tolerant): PostgreSQL, MongoDB, Redis (in cluster mode)
- **AP** (available + partition tolerant): Cassandra, DynamoDB, CouchDB
