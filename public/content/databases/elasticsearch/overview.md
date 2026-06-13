# Elasticsearch — Distributed Search and Analytics

Elasticsearch is a distributed search engine built on Apache Lucene. It's used for full-text search, log analytics, real-time monitoring, and vector search for AI applications.

## What Elasticsearch Does Best

| Use Case | Example |
|---|---|
| **Full-text search** | Search products, articles, documents |
| **Log analytics** | Parse and analyze terabytes of logs (ELK Stack) |
| **Time-series analytics** | Metrics, APM, infrastructure monitoring |
| **Geospatial search** | Find restaurants near me |
| **Vector search** | Semantic search, RAG for AI |
| **Faceted search** | Filter by category, price range, rating |

## Key Concepts

```
Document:  JSON object (like a row, but flexible schema)
Index:     Collection of documents (like a table)
Shard:     Index split across nodes for scale and parallelism
Replica:   Copy of a shard for fault tolerance and read scaling
Node:      Single Elasticsearch server instance
Cluster:   Multiple nodes working together
```

## Quick Start

```bash
# Start with Docker
docker run -d --name elasticsearch \
    -e "discovery.type=single-node" \
    -e "xpack.security.enabled=false" \
    -p 9200:9200 \
    elasticsearch:8.11.0

# Quick health check
curl -s localhost:9200/_cluster/health?pretty

# Index a document
curl -X POST localhost:9200/products/_doc \
    -H 'Content-Type: application/json' \
    -d '{"name": "MacBook Pro", "brand": "Apple", "price": 199999}'

# Search
curl localhost:9200/products/_search?q=macbook
```
