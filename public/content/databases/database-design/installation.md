# Database Design — Getting Set Up to Practice

Database design is best learned by actually building and querying real schemas, not just reading normal-form definitions. This page's examples are PostgreSQL-flavored, so that's the fastest path to following along directly.

## Local PostgreSQL setup

```bash
# macOS
brew install postgresql@16
brew services start postgresql@16

# Docker — fastest cross-platform option, no local install needed
docker run --name design-practice -e POSTGRES_PASSWORD=practice -p 5432:5432 -d postgres:16

# Connect
psql -h localhost -U postgres
```

## A GUI client, if you'd rather not work purely in `psql`

pgAdmin (free, PostgreSQL-specific) or a general tool like DBeaver (free, works across engines) both make it easier to visually inspect table structure and relationships while practicing — genuinely helpful early on, before ER diagrams and schema structure are second nature to read from raw DDL alone.

## Setting up a practice database with realistic (if small) data

```sql
CREATE DATABASE design_practice;
\c design_practice

-- Build the Overview's order-normalization example directly, so you can
-- query it and see the normalization payoff, not just read about it
CREATE TABLE customers (id SERIAL PRIMARY KEY, name VARCHAR(200), email VARCHAR(200));
CREATE TABLE categories (category_id SERIAL PRIMARY KEY, category_name VARCHAR(100));
CREATE TABLE products (product_id SERIAL PRIMARY KEY, product_name VARCHAR(200), category_id INT REFERENCES categories(category_id), price DECIMAL(10,2));
CREATE TABLE orders (order_id SERIAL PRIMARY KEY, customer_id INT REFERENCES customers(id), created_at TIMESTAMPTZ DEFAULT NOW());
CREATE TABLE order_items (order_id INT REFERENCES orders(order_id), product_id INT REFERENCES products(product_id), quantity INT, price DECIMAL(10,2), PRIMARY KEY (order_id, product_id));
```

## `EXPLAIN ANALYZE` — set this up as a habit from day one, not later

```sql
EXPLAIN ANALYZE SELECT * FROM orders WHERE customer_id = 1;
```

Get comfortable reading this output early — indexing strategy (Overview, Intermediate) is unlearnable in the abstract; you need to actually see a query plan change from a sequential scan to an index scan after adding an index, on your own practice data, for it to become real rather than theoretical.
