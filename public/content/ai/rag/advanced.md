# RAG Systems — Advanced

## GraphRAG

```python
# GraphRAG: use knowledge graphs for better multi-hop reasoning
# Traditional RAG: chunk → embed → search (misses relationships)
# GraphRAG: extract entities/relationships → build graph → traverse for context

# pip install graphrag

# Step 1: Build knowledge graph from documents
# graphrag index --root ./my_docs

# Step 2: Query with graph traversal
from graphrag.query.structured_search.global_search.search import GlobalSearch

# Global search: synthesize across the entire knowledge graph
# Good for: "What are all the security risks mentioned?"
result = await global_searcher.asearch("Summarize all DevOps best practices")

# Local search: find specific entities and their context
# Good for: "Tell me about Kubernetes pod scheduling"
result = await local_searcher.asearch("How does Kubernetes handle pod scheduling?")
```

## RAG Cheatsheet

```python
# ── CHUNKING STRATEGIES ───────────────────────────────────
from langchain.text_splitter import (
    RecursiveCharacterTextSplitter,  # Best general purpose
    MarkdownHeaderTextSplitter,      # Markdown documents
    PythonCodeTextSplitter,          # Python code
    TokenTextSplitter,               # Token-based (most precise)
)

splitter = RecursiveCharacterTextSplitter(
    chunk_size=500,          # Target chunk size in characters
    chunk_overlap=50,        # Overlap between chunks
    separators=["\n\n", "\n", ". ", " ", ""]  # Priority order
)

# ── VECTOR DATABASES ──────────────────────────────────────
# ChromaDB (local dev):
import chromadb
client = chromadb.PersistentClient(path="./chroma_db")
collection = client.get_or_create_collection("docs")
collection.add(documents=texts, embeddings=embeddings, ids=ids)
results = collection.query(query_embeddings=[q_emb], n_results=5)

# Pinecone (production):
from pinecone import Pinecone, ServerlessSpec
pc = Pinecone(api_key="...")
index = pc.Index("my-index")
index.upsert(vectors=[(id, embedding, metadata) for ...])
results = index.query(vector=q_emb, top_k=5, include_metadata=True)

# pgvector (if you already use PostgreSQL):
# CREATE EXTENSION vector;
# CREATE INDEX ON docs USING hnsw (embedding vector_cosine_ops);
# SELECT content FROM docs ORDER BY embedding <=> $1 LIMIT 5;

# ── EVALUATION METRICS ────────────────────────────────────
# pip install ragas
from ragas import evaluate
from ragas.metrics import faithfulness, answer_relevancy, context_precision

results = evaluate(
    dataset=eval_dataset,
    metrics=[faithfulness, answer_relevancy, context_precision],
)
# faithfulness: Is the answer supported by the context? (hallucination check)
# answer_relevancy: Does the answer address the question?
# context_precision: Were the retrieved chunks relevant?
```
