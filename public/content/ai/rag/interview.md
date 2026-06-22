# RAG (Retrieval Augmented Generation) Interview Questions

## Core Concepts

**Q: Explain RAG architecture end to end.**

RAG = Retrieval Augmented Generation. Combines a retrieval system with an LLM to answer questions from private/recent documents.

**Two phases:**

**Indexing (offline):**
```
Documents → Chunk → Embed → Store in Vector DB
```
1. Load documents (PDF, HTML, markdown, database)
2. Chunk into pieces (300-1000 tokens each, with overlap)
3. Embed each chunk with embedding model → dense vector
4. Store vectors + metadata in vector database (Qdrant, Pinecone, Weaviate, ChromaDB)

**Retrieval + Generation (online):**
```
User Query → Embed → Similarity Search → Top-K Chunks → LLM + Context → Answer
```
1. Embed user query with same embedding model
2. Similarity search in vector DB (cosine similarity)
3. Retrieve top-k most relevant chunks (typically k=3-5)
4. Inject chunks into LLM prompt as context
5. LLM generates answer grounded in retrieved context

---

**Q: What chunking strategies exist? How do you choose?**

**Fixed-size chunking**: Split every N tokens with M token overlap.
- Simple, fast. 
- Problem: splits mid-sentence, mid-table.
- Good for: homogeneous text (articles, logs).
- Typical: 512 tokens, 50 token overlap.

**Recursive character splitting**: Split by paragraphs → sentences → words if needed.
- Respects natural boundaries.
- LangChain `RecursiveCharacterTextSplitter` — most common.

**Semantic chunking**: Embed sentences, split where embedding similarity drops significantly.
- Groups semantically related content together.
- More expensive (requires embedding every sentence).
- Best for: diverse topics in same document.

**Document-structure-aware**: Split by markdown headers, PDF sections, HTML tags.
- Preserves document structure.
- Best for: technical docs, PDFs with clear structure.

**Parent-child chunking**: Store small chunks (for precise retrieval) + large chunks (for context in answer).
Retrieve small → return parent chunk to LLM.

---

**Q: How do you evaluate RAG pipeline quality?**

**RAGAS framework** (key metrics):

| Metric | Measures | Formula |
|---|---|---|
| **Faithfulness** | Is answer grounded in retrieved context? (no hallucination) | Claims in answer ÷ claims supported by context |
| **Answer Relevance** | Does answer address the question? | LLM scores relevance |
| **Context Recall** | Did retrieval find all relevant chunks? | Relevant retrieved ÷ total relevant |
| **Context Precision** | Were retrieved chunks relevant? | Relevant retrieved ÷ total retrieved |

**Offline evaluation**: Build eval dataset (questions + ground truth answers + relevant documents). Run RAGAS.
**Online evaluation**: Log queries → sample → human review. Track faithfulness score over time.

---

**Q: Advanced RAG techniques — what are they?**

**HyDE (Hypothetical Document Embedding)**: Generate hypothetical answer → embed it → search with hypothesis vector instead of question vector. Better semantic match for factual questions.

**Multi-query retrieval**: Generate 3-5 variations of the user's question → retrieve for each → merge results (union or RRF). Catches different phrasings.

**Re-ranking**: Retrieve 20-50 candidates → re-rank with cross-encoder (e.g., Cohere Rerank, bge-reranker) → return top 3. Better than pure vector similarity.

**Self-RAG**: LLM decides when to retrieve (not every query needs retrieval). Model generates "retrieve" tokens to trigger search, "relevant"/"irrelevant" tokens to filter results.

**Hybrid search**: Vector similarity + BM25 keyword search → combine with RRF (Reciprocal Rank Fusion). Better for exact term matches.

---

**Q: Production RAG — what fails and how do you fix it?**

| Problem | Symptom | Fix |
|---|---|---|
| Wrong chunks retrieved | Answer misses key info | Better chunking, metadata filters |
| Hallucination | Answer not in retrieved context | Add faithfulness prompt, lower temperature |
| Slow retrieval | High latency | Index optimisation, approximate search (HNSW), caching |
| Too much context | LLM ignores middle chunks | Compress/summarise chunks, use re-ranking |
| Poor embedding quality | Wrong semantic matches | Switch to better model (bge-large, text-embedding-3-large) |
| Stale knowledge | Outdated answers | Refresh embeddings pipeline on document update |

**Production stack example:**
```python
# Retrieval pipeline
docs = vector_store.similarity_search(query, k=20)  # Over-retrieve
docs = reranker.rerank(query, docs, top_k=4)         # Re-rank for quality
response = llm.invoke(prompt.format(context=docs, query=query))
faithfulness = ragas.evaluate(response, docs)         # Monitor quality
```

## Revision Notes
```
RAG PIPELINE:
INDEXING: Load → Chunk → Embed → Store in VectorDB
QUERY: Embed query → Similarity search → Top-K chunks → LLM + context → Answer

CHUNKING STRATEGIES:
Fixed-size (simple) | Recursive (respects boundaries) | Semantic (groups by meaning)
Document-structure-aware | Parent-child (small retrieve, large context)

RAGAS METRICS:
Faithfulness: no hallucination (answer supported by context)
Relevance: answer addresses question
Context Recall: retrieval completeness
Context Precision: retrieval precision

ADVANCED RAG:
HyDE: hypothetical answer → search | Multi-query: question variations → merge
Re-ranking: 20-50 candidates → cross-encoder → top 3
Hybrid search: vector + BM25 | Self-RAG: LLM controls retrieval

PRODUCTION FAILURES:
Wrong retrieval → better chunking/metadata | Hallucination → faithfulness prompt
Slow → HNSW index + caching | Too much context → re-ranking + compression
```
