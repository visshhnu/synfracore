# RAG Systems — Intermediate

## Retrieval Quality Improvement

```python
# Hybrid Search = Dense (semantic) + Sparse (keyword) retrieval
# Combines semantic understanding with exact term matching

from langchain_community.vectorstores import Chroma
from langchain_community.retrievers import BM25Retriever
from langchain.retrievers import EnsembleRetriever
from langchain_openai import OpenAIEmbeddings

# Load your documents
docs = load_documents()

# Dense retrieval (semantic similarity)
embeddings = OpenAIEmbeddings(model="text-embedding-3-small")
vectorstore = Chroma.from_documents(docs, embeddings)
dense_retriever = vectorstore.as_retriever(search_kwargs={"k": 5})

# Sparse retrieval (BM25 keyword matching)
sparse_retriever = BM25Retriever.from_documents(docs, k=5)

# Ensemble = best of both worlds
# 0.5/0.5 weight: equal importance
# 0.7/0.3 dense heavy: when semantic understanding is more important
ensemble = EnsembleRetriever(
    retrievers=[dense_retriever, sparse_retriever],
    weights=[0.6, 0.4]
)

# Query
docs = ensemble.invoke("kubernetes deployment rolling update strategy")
```

## Reranking

```python
# Cross-encoder reranker: score each (query, doc) pair more accurately
# Much slower than bi-encoder (embeddings) but much more accurate
# Typical pipeline: retrieve 50 candidates → rerank → return top 5

from sentence_transformers import CrossEncoder

reranker = CrossEncoder("cross-encoder/ms-marco-MiniLM-L-6-v2")

def retrieve_and_rerank(query: str, k_retrieve: int = 50, k_final: int = 5) -> list:
    # Step 1: Fast retrieval (many candidates)
    candidates = vectorstore.similarity_search(query, k=k_retrieve)

    # Step 2: Accurate reranking (fewer results)
    pairs = [(query, doc.page_content) for doc in candidates]
    scores = reranker.predict(pairs)

    # Sort by reranker score
    ranked = sorted(zip(scores, candidates), reverse=True)
    return [doc for _, doc in ranked[:k_final]]
```

## Context Window Management

```python
# Smart context: include only the most relevant chunks
# Don't just stuff everything into the context window

def build_rag_context(query: str, max_tokens: int = 3000) -> str:
    """Build context that fits within token budget."""
    chunks = retrieve_and_rerank(query, k_final=10)

    context_parts = []
    estimated_tokens = 0

    for chunk in chunks:
        # Rough estimation: 1 token ≈ 4 chars
        chunk_tokens = len(chunk.page_content) // 4
        if estimated_tokens + chunk_tokens > max_tokens:
            break
        context_parts.append(
            f"[Source: {chunk.metadata.get('source', 'unknown')}]\n{chunk.page_content}"
        )
        estimated_tokens += chunk_tokens

    return "\n\n---\n\n".join(context_parts)

def answer_with_rag(question: str) -> dict:
    context = build_rag_context(question)

    response = client.messages.create(
        model="claude-sonnet-4-6",
        max_tokens=1024,
        system="""Answer questions based on the provided context.
If the answer isn't in the context, say "I couldn't find this in the documentation."
Always quote the relevant part of the source.""",
        messages=[{"role": "user", "content": f"Context:\n{context}\n\nQuestion: {question}"}]
    )

    return {
        "answer": response.content[0].text,
        "sources": list(set(c.metadata.get("source") for c in retrieve_and_rerank(question))),
        "tokens_used": response.usage.input_tokens + response.usage.output_tokens
    }
```
