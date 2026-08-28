# Elasticsearch Overview

**Before you start:** basic familiarity with JSON and REST APIs is assumed. No prior search-engine or Elasticsearch experience is required.

## What is Elasticsearch?

Elasticsearch is an open-source, distributed, RESTful search and analytics engine built on Apache Lucene. It is part of the Elastic Stack (formerly ELK Stack: Elasticsearch, Logstash, Kibana) and is used for full-text search, log analytics, APM, security analytics, and vector search.

## Why This Exists (The Hook)

A relational database's `LIKE '%widget%'` search has to check every single row, character by character, because it has no way to know in advance which rows contain "widget" — there's no index built for arbitrary substring search across free text. Elasticsearch exists to solve exactly this: it pre-processes text into an inverted index (a map from every word to the documents containing it) at write time, so a search for "widget" across millions of documents becomes a fast index lookup instead of a full scan — the same fundamental trick a book's index uses versus reading every page.

**Analogy** — Think of a relational database searching text like reading an entire book cover-to-cover every time you want to find a mention of a specific word. Elasticsearch is like that same book, but with a detailed index in the back listing every significant word and every page it appears on — built once when the book was printed, so any future lookup is instant regardless of how long the book is.

**Try it (2 minutes)** — Reason through why Elasticsearch isn't a good primary transactional store, without running anything: updating a single field in an existing Elasticsearch document doesn't modify it in place — it marks the old document deleted and indexes a brand new one, because the underlying Lucene segments are immutable once written. If an application updated the same "product view count" field thousands of times per second, what would that mean for how many "deleted" documents accumulate over time, compared to a database built for frequent in-place row updates?

## Core Concepts

```
CLUSTER: one or more nodes working together
NODE: single Elasticsearch instance (server)
  Master node: cluster coordination, index management
  Data node: stores data, executes queries
  Ingest node: data transformation pipeline
  Coordinating node: routes requests, aggregates results

INDEX: collection of documents (like a database)
  Shard: unit of distribution | each index has primary + replica shards
  Primary shards: set at index creation (cannot change without reindex)
  Replica shards: copies of primary shards (for HA + read scaling)

DOCUMENT: JSON object (like a row) with unique _id
MAPPING: defines field types (like a schema, but flexible)
  Dynamic mapping: Elasticsearch infers types automatically
  Explicit mapping: you define types for control and performance
```

```conceptgrid
{
  "boxes": [
    { "title": "Cluster / Node", "description": "One or more nodes working together -- master, data, ingest, coordinating roles", "color": "blue" },
    { "title": "Index", "description": "Collection of documents, like a database -- split into primary + replica shards", "color": "purple" },
    { "title": "Document", "description": "A JSON object with a unique _id, like a row", "color": "amber" },
    { "title": "Mapping", "description": "Defines field types -- like a schema, but flexible (dynamic or explicit)", "color": "green" }
  ]
}
```

## REST API Basics

```bash
# Cluster health
curl -X GET "localhost:9200/_cluster/health?pretty"
curl -X GET "localhost:9200/_cat/nodes?v"
curl -X GET "localhost:9200/_cat/indices?v&s=index"

# Create index with mapping
curl -X PUT "localhost:9200/products" -H 'Content-Type: application/json' -d'
{
  "settings": { "number_of_shards": 1, "number_of_replicas": 1 },
  "mappings": {
    "properties": {
      "name": { "type": "text", "analyzer": "english" },
      "price": { "type": "float" },
      "category": { "type": "keyword" },
      "created_at": { "type": "date" },
      "description_vector": { "type": "dense_vector", "dims": 1536 }
    }
  }
}'

# Index a document
curl -X POST "localhost:9200/products/_doc/1" -H 'Content-Type: application/json' -d'
{ "name": "Laptop Pro", "price": 999.99, "category": "electronics" }'

# Search
curl -X GET "localhost:9200/products/_search" -H 'Content-Type: application/json' -d'
{
  "query": {
    "bool": {
      "must": [{"match": {"name": "laptop"}}],
      "filter": [
        {"term": {"category": "electronics"}},
        {"range": {"price": {"gte": 500, "lte": 2000}}}
      ]
    }
  },
  "sort": [{"price": "asc"}],
  "size": 10, "from": 0
}'

# Aggregations
curl -X GET "localhost:9200/products/_search" -H 'Content-Type: application/json' -d'
{
  "size": 0,
  "aggs": {
    "by_category": {
      "terms": { "field": "category", "size": 10 },
      "aggs": { "avg_price": { "avg": { "field": "price" } } }
    }
  }
}'

# Delete index
curl -X DELETE "localhost:9200/products"
```

## When to Use Elasticsearch

```conceptgrid
{
  "boxes": [
    { "title": "Full-Text Search", "description": "Product search, document search", "color": "blue" },
    { "title": "Log Analytics", "description": "ELK stack for application/infrastructure logs", "color": "purple" },
    { "title": "Vector / Semantic Search", "description": "AI applications", "color": "amber" },
    { "title": "Real-Time Dashboards", "description": "Kibana-powered analytics", "color": "green" }
  ]
}
```

```
EXCELLENT FOR:
  Full-text search (product search, document search)
  Log analytics (ELK stack for application/infrastructure logs)
  APM (Application Performance Monitoring)
  Security analytics (SIEM)
  Vector search / semantic search (AI applications)
  Geospatial queries (location-based search)
  Real-time analytics dashboards (Kibana)

NOT IDEAL FOR:
  Primary transactional data store (use PostgreSQL/MySQL)
  ACID transactions (limited support)
  Frequent updates to same documents (creates deleted markers)
  Data with complex relationships requiring joins
  Simple key-value lookups (use Redis/DynamoDB)

ELASTICSEARCH VS OPENSEARCH:
  OpenSearch: AWS fork of Elasticsearch 7.10, created after Elastic moved
    away from Apache 2.0 in 2021 (with the 7.11 release) — open source
    (Apache 2.0), fully independent project with its own roadmap since
  Elasticsearch: as of a 2024 licensing change, Elastic added AGPLv3 as a
    THIRD licensing option alongside SSPL and Elastic License 2.0 — meaning
    Elasticsearch/Kibana are open source again (AGPLv3 is OSI-approved)
    *(needs verification — confirm the exact date directly with Elastic's
    own announcement)*
  APIs still broadly similar, but the two projects have been diverging in
    features/internals since the 2021 split — "avoid licensing concerns"
    is a weaker argument for choosing OpenSearch now that Elasticsearch
    offers an OSI-approved option; "which one has the features I need" is
    now the more relevant question
  Amazon OpenSearch Service: managed AWS offering (formerly Amazon Elasticsearch)
```

## Study Resources
- **Elasticsearch documentation** (elastic.co/guide) — comprehensive official docs
- **Elasticsearch: The Definitive Guide** — free online (older but foundational)
- **Elastic Certified Engineer** — professional certification
- **OpenSearch documentation** (opensearch.org/docs) — AWS fork documentation
