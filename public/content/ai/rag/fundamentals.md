# RAG Systems — Fundamentals

## What is RAG

```
RAG = Retrieval Augmented Generation

Problem: LLMs have a knowledge cutoff and can't access private data
Solution: Retrieve relevant documents at query time, inject into prompt

Flow:
  User question
      ↓
  Embed question → vector
      ↓
  Search vector database (find similar document chunks)
      ↓
  Retrieve top-K chunks
      ↓
  Inject chunks into prompt + question
      ↓
  LLM generates answer grounded in retrieved context
```

## Building a RAG Pipeline

```python
from anthropic import Anthropic
import chromadb
from chromadb.utils import embedding_functions

# 1. Setup embedding model and vector DB
ef = embedding_functions.SentenceTransformerEmbeddingFunction(
    model_name="all-MiniLM-L6-v2"  # Fast, good quality, free
)
chroma = chromadb.Client()
collection = chroma.create_collection("docs", embedding_function=ef)

# 2. Ingest documents (chunk and embed)
def ingest_document(text: str, doc_id: str, metadata: dict):
    """Split document into chunks and store in vector DB."""
    # Simple chunking by sentences (use LangChain for better chunking)
    chunks = []
    sentences = text.split('. ')
    current_chunk = ""

    for sentence in sentences:
        if len(current_chunk) + len(sentence) < 500:  # 500 char chunks
            current_chunk += sentence + ". "
        else:
            if current_chunk:
                chunks.append(current_chunk.strip())
            current_chunk = sentence + ". "
    if current_chunk:
        chunks.append(current_chunk.strip())

    collection.add(
        documents=chunks,
        ids=[f"{doc_id}_chunk_{i}" for i in range(len(chunks))],
        metadatas=[{**metadata, "chunk": i} for i in range(len(chunks))]
    )
    return len(chunks)

# Ingest your docs
ingest_document(open("runbook.md").read(), "runbook", {"source": "runbook.md", "type": "operations"})
ingest_document(open("api-docs.md").read(), "api-docs", {"source": "api-docs.md", "type": "api"})

# 3. Query with RAG
client = Anthropic()

def rag_query(question: str, n_results: int = 5) -> str:
    # Retrieve relevant chunks
    results = collection.query(
        query_texts=[question],
        n_results=n_results,
        include=["documents", "metadatas", "distances"]
    )

    # Build context from retrieved chunks
    context_parts = []
    for doc, meta, dist in zip(
        results["documents"][0],
        results["metadatas"][0],
        results["distances"][0]
    ):
        if dist < 0.8:  # Filter by similarity threshold
            context_parts.append(f"Source: {meta['source']}\n{doc}")

    context = "\n\n---\n\n".join(context_parts)

    # Generate answer
    response = client.messages.create(
        model="claude-sonnet-4-6",
        max_tokens=1024,
        system="""You are a helpful assistant. Answer questions based ONLY on the provided context.
If the context doesn't contain enough information, say so clearly.
Always cite which source document you used.""",
        messages=[{
            "role": "user",
            "content": f"Context:\n{context}\n\nQuestion: {question}"
        }]
    )
    return response.content[0].text
```

## Chunking Strategies

```python
# 1. Fixed size (simple, often good enough)
def fixed_size_chunks(text, chunk_size=500, overlap=50):
    chunks = []
    for i in range(0, len(text), chunk_size - overlap):
        chunks.append(text[i:i + chunk_size])
    return chunks

# 2. Recursive character splitting (better)
from langchain.text_splitter import RecursiveCharacterTextSplitter
splitter = RecursiveCharacterTextSplitter(
    chunk_size=500,
    chunk_overlap=50,
    separators=["\n\n", "\n", ". ", " ", ""]
)
chunks = splitter.split_text(document)

# 3. Semantic chunking (best quality)
# Split at topic boundaries, not character counts
# Use embedding similarity to detect topic shifts

# 4. Document-aware (for structured docs)
# Markdown: split on ## headings
# Code: split on function/class boundaries
# PDFs: split on pages or sections
```

## Embedding Models

```python
# Free / Open Source
# all-MiniLM-L6-v2: Fast, 384 dims, great for most uses
# all-mpnet-base-v2: Better quality, 768 dims, slower
# BAAI/bge-m3: Multilingual, state-of-the-art

# API-based (paid)
# OpenAI text-embedding-3-small: Cheap, 1536 dims
# OpenAI text-embedding-3-large: Best quality, 3072 dims
# Cohere embed-v3: Strong multilingual

import openai
def embed(texts: list[str]) -> list[list[float]]:
    response = openai.embeddings.create(
        model="text-embedding-3-small",
        input=texts
    )
    return [item.embedding for item in response.data]
```

## Vector Databases

```
ChromaDB:   Open source, easy setup, good for prototypes
Pinecone:   Managed, scalable, simple API
Weaviate:   Open source, schema-aware, built-in BM25
Qdrant:     Open source, fast, rich filtering
pgvector:   PostgreSQL extension — if you already use Postgres
            No extra DB to manage!

# pgvector example
CREATE EXTENSION vector;
CREATE TABLE documents (
    id SERIAL PRIMARY KEY,
    content TEXT,
    embedding vector(1536),  -- dimension matches your model
    metadata JSONB
);
CREATE INDEX ON documents USING ivfflat (embedding vector_cosine_ops);

-- Similarity search
SELECT content, metadata,
       1 - (embedding <=> $1::vector) AS similarity
FROM documents
ORDER BY embedding <=> $1::vector
LIMIT 5;
```
