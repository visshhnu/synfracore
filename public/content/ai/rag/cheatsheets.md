# RAG Systems — Cheatsheet

```python
# ── MINIMAL RAG SETUP ─────────────────────────────────────
# pip install chromadb sentence-transformers anthropic

import chromadb
from sentence_transformers import SentenceTransformer
import anthropic

# Setup
model = SentenceTransformer('all-MiniLM-L6-v2')
chroma = chromadb.PersistentClient(path="./rag_db")
collection = chroma.get_or_create_collection("docs")

# Index documents
def index_docs(docs: list[dict]):
    """docs = [{'content': '...', 'source': '...'}]"""
    texts = [d['content'] for d in docs]
    embeddings = model.encode(texts).tolist()
    collection.add(
        documents=texts,
        embeddings=embeddings,
        metadatas=[{'source': d['source']} for d in docs],
        ids=[f"doc_{i}" for i in range(len(docs))]
    )

# Query
def rag_query(question: str, k: int = 5) -> str:
    q_emb = model.encode([question]).tolist()
    results = collection.query(query_embeddings=q_emb, n_results=k)
    
    context = "\n\n".join(results['documents'][0])
    
    client = anthropic.Anthropic()
    r = client.messages.create(
        model="claude-sonnet-4-6", max_tokens=1024,
        messages=[{"role": "user", "content": 
            f"Context:\n{context}\n\nQuestion: {question}\n\n"
            "Answer based only on the context above."}]
    )
    return r.content[0].text

# ── CHUNKING QUICK REFERENCE ──────────────────────────────
# Fixed size:     chunk_size=500, overlap=50  (simple, good enough)
# Markdown:       Split on ## headings
# Code:           Split on function/class boundaries
# Semantic:       Split at topic shifts (use embeddings)

# Rule of thumb: chunks should be self-contained meaning units
# Too small (<100 tokens): loses context
# Too large (>1000 tokens): embeds multiple topics, retrieval noise

# ── EMBEDDING MODELS ──────────────────────────────────────
# Free:    all-MiniLM-L6-v2 (fast, 384-dim, good general quality)
#          all-mpnet-base-v2 (better quality, 768-dim)
# API:     text-embedding-3-small ($0.02/1M tokens, 1536-dim)
#          text-embedding-3-large (best quality, 3072-dim, more expensive)

# ── RETRIEVAL STRATEGIES ──────────────────────────────────
# Dense only:   Fast, semantic understanding
# BM25 only:    Exact keyword matching
# Hybrid:       Dense + BM25 (best quality, use this)
# Reranking:    Cross-encoder on top 50 candidates, return top 5

# ── EVALUATION METRICS ────────────────────────────────────
# Faithfulness:       Answer supported by context? (hallucination check)
# Context Precision:  Retrieved chunks actually relevant?
# Context Recall:     Did we retrieve ALL necessary info?
# Answer Relevancy:   Does the answer address the question?
# pip install ragas → evaluate(dataset, metrics=[faithfulness, ...])

# ── COMMON ISSUES AND FIXES ───────────────────────────────
# Hallucination:    Use faithfulness check, cite sources, lower temperature
# Wrong retrieval:  Try hybrid search, reranking, better chunking
# Context too long: Use reranking + limit to top 3 chunks
# Slow retrieval:   Add HNSW index, use fewer chunks (k=3 instead of 10)
# Stale data:       Re-index on schedule, use metadata filtering by date
```
