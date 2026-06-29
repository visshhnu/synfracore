# Database Design — Overview

## What is Database Design?

Database design is the process of producing a detailed data model for a database. It determines what data gets stored, how it's organized, what relationships exist, and what constraints enforce data integrity.

---

## Normalization — The Foundation

### Normal Forms

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

| Guarantee | Meaning | Example |
|-----------|---------|---------|
| Consistency | All nodes see same data at same time | PostgreSQL, MySQL |
| Availability | Every request gets a response | Cassandra, DynamoDB |
| Partition Tolerance | System works despite network splits | (all distributed systems need this) |

**CAP says: pick 2.** In practice, P is required, so you choose between C and A:
- **CP** (consistent + partition tolerant): PostgreSQL, MongoDB, Redis (in cluster mode)
- **AP** (available + partition tolerant): Cassandra, DynamoDB, CouchDB
