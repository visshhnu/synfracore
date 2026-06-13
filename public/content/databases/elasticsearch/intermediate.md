# Elasticsearch — Intermediate

## Relevance Tuning

```json
// Boost important fields, customize relevance scoring
GET /products/_search
{
  "query": {
    "multi_match": {
      "query": "macbook pro laptop",
      "fields": [
        "name^3",          // name is 3x more important
        "description^1",
        "brand^2",
        "tags"
      ],
      "type": "best_fields",  // Score by best matching field
      "fuzziness": "AUTO",    // Typo tolerance
      "operator": "and"       // All terms must appear
    }
  },
  "functions": [
    {
      "filter": { "term": { "in_stock": true } },
      "weight": 2             // Boost in-stock items
    },
    {
      "field_value_factor": {
        "field": "rating",
        "factor": 1.5,
        "modifier": "log1p"   // log(1 + rating * 1.5)
      }
    }
  ],
  "boost_mode": "multiply"    // Multiply base score by functions
}
```

## Percolator — Reverse Search

```json
// Normal search: find documents matching a query
// Percolator: find queries matching a document
// Use case: "alert me when a new product under $100 is added"

// Register a query as a document
PUT /product-alerts/_doc/alert-1
{
  "query": {
    "bool": {
      "must": [
        { "match": { "category": "laptop" } },
        { "range": { "price": { "lte": 50000 } } }
      ]
    }
  },
  "user_id": "user-123",
  "alert_type": "price_watch"
}

// When a new product is added, check which alerts it matches
POST /product-alerts/_search
{
  "query": {
    "percolate": {
      "field": "query",
      "document": {
        "name": "Budget Laptop",
        "category": "laptop",
        "price": 35000
      }
    }
  }
}
// Returns alert-1 → notify user-123
```

## Vector Search (Semantic Search)

```python
from elasticsearch import Elasticsearch
import openai

es = Elasticsearch("http://localhost:9200")

# Create index with dense_vector field
es.indices.create(index="docs", body={
    "mappings": {
        "properties": {
            "content": {"type": "text"},
            "embedding": {
                "type": "dense_vector",
                "dims": 1536,
                "index": True,
                "similarity": "cosine"
            }
        }
    }
})

# Index documents with embeddings
def get_embedding(text: str) -> list:
    response = openai.embeddings.create(model="text-embedding-3-small", input=text)
    return response.data[0].embedding

docs = ["Kubernetes deployment guide", "Docker container basics", "AWS EC2 tutorial"]
for i, doc in enumerate(docs):
    es.index(index="docs", id=i, document={
        "content": doc,
        "embedding": get_embedding(doc)
    })

# Semantic search
query_vector = get_embedding("how to deploy to kubernetes")
results = es.search(index="docs", body={
    "knn": {
        "field": "embedding",
        "query_vector": query_vector,
        "k": 5,
        "num_candidates": 50
    }
})
```
