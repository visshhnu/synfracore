# SQL — Structured Query Language

SQL is the universal language for working with relational databases. Whether you're a data analyst, backend developer, or DevOps engineer, SQL is a fundamental skill.

## What is SQL?

SQL (Structured Query Language) is the standard language for querying, manipulating, and managing relational databases. Originally developed at IBM in the 1970s, it's now supported by virtually every database system: PostgreSQL, MySQL, SQLite, SQL Server, Oracle, Snowflake, BigQuery, and more.

## Why SQL Still Dominates

Despite decades of NoSQL databases, SQL databases handle the vast majority of transactional workloads. Why?

- **ACID transactions** — Atomicity, Consistency, Isolation, Durability
- **Structured data** — Perfect for financial, HR, operational data
- **Powerful queries** — Joins, aggregations, window functions
- **Mature ecosystem** — Decades of tools, knowledge, optimization
- **Ubiquity** — Every company runs at least one SQL database

## Database Types

| Database | Best For | Notable Feature |
|----------|---------|-----------------|
| PostgreSQL | Complex queries, JSON | Best open-source, extensible |
| MySQL/MariaDB | Web applications | Fast reads, widely hosted |
| SQLite | Embedded, local | Zero config, single file |
| SQL Server | Microsoft ecosystem | SSRS, SSIS integration |
| Snowflake | Data warehousing | Columnar, cloud-native |
| BigQuery | Analytics at scale | Serverless, petabyte scale |

## Relational Model

Data is organized into **tables** (relations). Each table has:
- **Rows** (records/tuples) — each represents one entity
- **Columns** (attributes/fields) — each represents one property
- **Primary Key** — unique identifier for each row
- **Foreign Key** — reference to primary key in another table

Relationships between tables:
- **One-to-Many** — One customer has many orders
- **Many-to-Many** — Orders have many products, products in many orders (needs junction table)
- **One-to-One** — User has one profile