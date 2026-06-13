# AWS DynamoDB — Serverless NoSQL at Any Scale

DynamoDB is AWS's fully managed NoSQL database. No servers to manage, no capacity planning (in on-demand mode), and it automatically scales to handle any amount of traffic — from zero to millions of requests per second.

## What Makes DynamoDB Different

```
Traditional DB:   You provision servers, manage connections, tune queries
DynamoDB:         You define access patterns, AWS handles everything else

Billing model:    Pay per read/write request (on-demand) or provision throughput (reserved)
Latency:          Single-digit milliseconds at any scale
Limits:           Item max 400KB, no SQL joins, limited query flexibility
Strengths:        Zero ops, infinite scale, serverless integration
```

## Core Concepts

```
Table:          Collection of items (no schema enforcement)
Item:           One record — like a JSON document (max 400KB)
Attribute:      Key-value pair within an item
Partition Key:  Required — determines which partition stores data (hash key)
Sort Key:       Optional — enables range queries and ordering within a partition
```

## Design-First Approach

DynamoDB forces you to think about access patterns BEFORE designing the table. This is the opposite of SQL where you normalize first and write queries later.

```
Step 1: List ALL access patterns
  1. Get user by ID
  2. Get all orders for a user
  3. Get order by order ID
  4. Get all pending orders (for admin)
  5. Get orders by user, filtered by status

Step 2: Design keys to support those patterns
  PK: USER#<userId>   SK: PROFILE     → supports pattern 1
  PK: USER#<userId>   SK: ORDER#<orderId> → supports patterns 2, 3
  GSI: PK=status, SK=createdAt        → supports patterns 4, 5
```
