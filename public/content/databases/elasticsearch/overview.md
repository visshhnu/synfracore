# Elasticsearch Overview

## What is Elasticsearch?

Elasticsearch is an open-source, distributed, RESTful search and analytics engine built on Apache Lucene. It is part of the Elastic Stack (formerly ELK Stack: Elasticsearch, Logstash, Kibana) and is used for full-text search, log analytics, APM, security analytics, and vector search.

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
  OpenSearch: AWS fork of Elasticsearch 7.10 (open source, Apache 2.0)
  Elasticsearch: Elastic's version (dual license from 7.11+)
  APIs very similar; OpenSearch preferred on AWS (no licensing concerns)
  Amazon OpenSearch Service: managed AWS offering (formerly Amazon Elasticsearch)
```

## Study Resources
- **Elasticsearch documentation** (elastic.co/guide) — comprehensive official docs
- **Elasticsearch: The Definitive Guide** — free online (older but foundational)
- **Elastic Certified Engineer** — professional certification
- **OpenSearch documentation** (opensearch.org/docs) — AWS fork documentation
