# Python Foundations for AI — Intermediate

## Streaming responses — why it matters more than it seems

A non-streamed API call waits for the entire response before returning anything — fine for short answers, a genuinely bad user experience for anything long (a user staring at a blank screen for 8 seconds vs. text appearing as it's generated). Streaming is a real Python pattern (generators), not an AI-specific trick:

```python
def stream_response(prompt: str):
    with client.messages.stream(
        model="claude-sonnet-4-6",
        max_tokens=1000,
        messages=[{"role": "user", "content": prompt}],
    ) as stream:
        for text in stream.text_stream:
            yield text   # a generator — caller can print/render as chunks arrive
```

The `yield` here is the whole point: the caller can start rendering output the moment the first chunk arrives, rather than waiting for the full response object to exist before doing anything.

## Type hints for AI code specifically — where they earn their keep

Type hints matter more in AI code than average Python code, because API responses often have inconsistent optional fields (a `citations` field that's sometimes present, sometimes `None`), and a type hint that captures that explicitly catches a whole class of bugs before runtime:

```python
from typing import Optional

def extract_answer(response: dict) -> Optional[str]:
    """Returns None if the response doesn't contain an answer field —
    explicit Optional forces callers to handle the missing case."""
    return response.get("answer")
```

Without the `Optional` hint (and a linter/type-checker actually enforcing it), it's easy to write code that assumes `extract_answer()` always returns a string, then crashes on a `None.upper()` call three functions later — far from where the actual missing data originated.

## Building a simple RAG retrieval function

This is where the Overview's cosine-similarity NumPy code becomes a real, usable function:

```python
import numpy as np

def find_most_similar(query_embedding: np.ndarray, document_embeddings: list[np.ndarray], top_k: int = 3) -> list[int]:
    similarities = [
        np.dot(query_embedding, doc) / (np.linalg.norm(query_embedding) * np.linalg.norm(doc))
        for doc in document_embeddings
    ]
    # argsort gives ascending order — reverse and slice for top-k
    ranked_indices = np.argsort(similarities)[::-1][:top_k]
    return ranked_indices.tolist()
```

This function, in slightly more production-hardened form (batched, vectorized instead of a Python loop over embeddings), is the actual core of most "search your documents" RAG systems — the vector database (Pinecone, Weaviate, pgvector) is largely doing this same math at scale, with indexing to make it fast over millions of documents instead of a Python loop.

## Managing conversation context windows

Every model has a token limit, and a growing conversation history eventually exceeds it. A common intermediate pattern — summarize older turns instead of dropping them silently:

```python
def trim_history(history: list[dict], max_turns: int = 10) -> list[dict]:
    if len(history) <= max_turns:
        return history
    # Keep the system context + most recent turns; older turns would need
    # a real summarization call here in a production system, not just dropping
    return history[:1] + history[-(max_turns - 1):]
```

Silently truncating history (as the simplified version above does) loses information; a genuinely production-grade version calls the model itself to summarize the dropped turns into a shorter context before discarding the originals — worth knowing that distinction even if you start with the simpler version.

## Working with structured output (JSON mode / function calling)

Modern LLM APIs support constraining output to a specific schema rather than free text — critical for building anything that needs reliable, parseable output rather than hoping the model's prose happens to be parseable:

```python
import json

def get_structured_response(prompt: str, schema: dict) -> dict:
    response = call_model_with_schema(prompt, schema)  # SDK-specific call
    return json.loads(response)  # should now reliably match schema, not just "usually"
```

The practical value: without structured output, parsing a model's free-text response for a specific field is fragile (the model might phrase things slightly differently each time); with it, you get a contract you can actually build reliable code against.
