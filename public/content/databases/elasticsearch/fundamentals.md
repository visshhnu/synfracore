# Elasticsearch — Fundamentals

## Core Concepts

```
Document:   JSON object stored in Elasticsearch (like a row)
Index:      Collection of documents (like a table)
Shard:      Index split into pieces; each is a self-contained Lucene index
Replica:    Copy of a shard (redundancy + read scaling)
Node:       Single Elasticsearch instance
Cluster:    Group of nodes sharing data and workload
```

## Index and Search

```bash
# Create index with explicit mapping
curl -X PUT "localhost:9200/products" -H 'Content-Type: application/json' -d '{
  "mappings": {
    "properties": {
      "name":        { "type": "text" },
      "brand":       { "type": "keyword" },
      "price":       { "type": "float" },
      "in_stock":    { "type": "boolean" },
      "created_at":  { "type": "date" },
      "description": { "type": "text", "analyzer": "english" },
      "tags":        { "type": "keyword" }
    }
  },
  "settings": { "number_of_shards": 3, "number_of_replicas": 1 }
}'

# Index a document
curl -X POST "localhost:9200/products/_doc/1" -H 'Content-Type: application/json' -d '{
  "name": "MacBook Pro 16",
  "brand": "Apple",
  "price": 249999,
  "in_stock": true,
  "tags": ["laptop", "apple", "professional"]
}'

# Full-text search
curl -X GET "localhost:9200/products/_search" -d '{
  "query": {
    "match": { "name": "macbook laptop" }
  }
}'

# Boolean query (most common in production)
curl -X GET "localhost:9200/products/_search" -d '{
  "query": {
    "bool": {
      "must":   [{ "match": { "description": "professional editing" }}],
      "filter": [
        { "term":  { "brand": "Apple" }},
        { "term":  { "in_stock": true }},
        { "range": { "price": { "gte": 50000, "lte": 300000 }}}
      ],
      "should": [{ "term": { "tags": "featured" }}],
      "must_not": [{ "term": { "brand": "Knockoff" }}]
    }
  },
  "sort": [{ "price": "asc" }],
  "from": 0, "size": 20,
  "_source": ["name", "brand", "price"]
}'
```

## Analyzers and Tokenization

```json
// Standard analyzer: lowercase + stop words + tokenize
"hello WORLD" → ["hello", "world"]

// English analyzer: stemming (running → run, dogs → dog)
"running dogs" → ["run", "dog"]

// Keyword: no analysis (exact match only)
"New York" → ["New York"]

// Custom analyzer
PUT /my-index
{
  "settings": {
    "analysis": {
      "analyzer": {
        "my_analyzer": {
          "type": "custom",
          "tokenizer": "standard",
          "filter": ["lowercase", "stop", "snowball"]
        }
      }
    }
  }
}
```

## Aggregations

```json
GET /orders/_search
{
  "size": 0,
  "aggs": {
    "sales_by_category": {
      "terms": { "field": "category", "size": 10 },
      "aggs": {
        "total_revenue": { "sum": { "field": "amount" }},
        "avg_order":     { "avg": { "field": "amount" }}
      }
    },
    "orders_over_time": {
      "date_histogram": {
        "field": "created_at",
        "calendar_interval": "month"
      },
      "aggs": {
        "monthly_revenue": { "sum": { "field": "amount" }}
      }
    },
    "price_percentiles": {
      "percentiles": {
        "field": "amount",
        "percents": [50, 75, 95, 99]
      }
    }
  }
}
```

## Python Client

```python
from elasticsearch import Elasticsearch

es = Elasticsearch(["http://localhost:9200"])

# Index document
es.index(index="products", id=1, document={
    "name": "iPhone 15", "brand": "Apple", "price": 79999
})

# Search
result = es.search(index="products", body={
    "query": {"match": {"name": "iphone"}},
    "sort": [{"price": "asc"}]
})

for hit in result["hits"]["hits"]:
    print(hit["_source"]["name"], hit["_score"])

# Bulk indexing (much faster)
from elasticsearch.helpers import bulk
actions = [
    {"_index": "products", "_id": p["id"], "_source": p}
    for p in products
]
bulk(es, actions)
```
