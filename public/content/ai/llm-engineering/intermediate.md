# LLM Engineering Intermediate

## Production RAG Architecture
A simple retrieval is not enough for production. Add these layers:

```
Query → Preprocessing → Hybrid Retrieval → Reranking → Context Assembly → LLM → Guardrails → Response
```

## Hybrid Search: Dense + Sparse
```python
from qdrant_client import QdrantClient, models

# Dense vector search (semantic)
dense_results = client.search(
    collection_name="docs",
    query_vector=embed(query),
    limit=20
)

# Sparse search via BM25 (keyword match)
from rank_bm25 import BM25Okapi
bm25 = BM25Okapi([doc.split() for doc in corpus])
sparse_scores = bm25.get_scores(query.split())

# Merge both with Reciprocal Rank Fusion
def rrf(lists, k=60):
    scores = {}
    for lst in lists:
        for rank, doc_id in enumerate(lst):
            scores[doc_id] = scores.get(doc_id, 0) + 1/(k + rank + 1)
    return sorted(scores, key=lambda x: scores[x], reverse=True)
```

## Reranking
After retrieving 20 candidates, a cross-encoder reranker picks the best 5:

```python
from sentence_transformers import CrossEncoder
reranker = CrossEncoder("cross-encoder/ms-marco-MiniLM-L-6-v2")

pairs = [(query, chunk.text) for chunk in candidates]
scores = reranker.predict(pairs)
top_5 = sorted(zip(candidates, scores), key=lambda x: x[1], reverse=True)[:5]
```

## Streaming Responses
```python
with client.chat.completions.stream(
    model="gpt-4o",
    messages=messages
) as stream:
    for chunk in stream:
        delta = chunk.choices[0].delta.content
        if delta:
            print(delta, end="", flush=True)
```

## Cost Optimisation
| Strategy | Typical Saving |
|----------|---------------|
| Cache repeated queries in Redis | 40-80% |
| Use gpt-4o-mini for simple tasks | 80-90% |
| Reduce max_tokens to actual need | 10-30% |
| Compress prompts with gzip-like rewriting | 5-20% |
| OpenAI Batch API | 50% on large workloads |

```python
import hashlib, json
import redis

r = redis.Redis()

def cached_llm(prompt, model="gpt-4o-mini", ttl=3600):
    key = "llm:" + hashlib.sha256(f"{model}:{prompt}".encode()).hexdigest()
    cached = r.get(key)
    if cached:
        return json.loads(cached)
    result = llm_call(prompt, model)
    r.setex(key, ttl, json.dumps(result))
    return result
```

## Prompt Versioning
Track your prompts like code:

```python
PROMPTS = {
    "v1.0": "Answer the question: {q}",
    "v1.1": "You are an expert. Answer concisely: {q}",
    "v2.0": "You are an expert. Use context only. If unsure say so. Question: {q}",
}

ACTIVE_PROMPT = "v2.0"

def run(question, context):
    prompt = PROMPTS[ACTIVE_PROMPT].format(q=question, ctx=context)
    return llm_call(prompt)
```

## Evaluation with RAGAS
```python
from ragas import evaluate
from ragas.metrics import faithfulness, answer_relevancy, context_recall
from datasets import Dataset

data = {
    "question": ["What is PDGM?"],
    "answer": [model_answer],
    "contexts": [[chunk1, chunk2]],
    "ground_truth": ["PDGM stands for Patient-Driven Groupings Model..."]
}
results = evaluate(Dataset.from_dict(data),
                   metrics=[faithfulness, answer_relevancy, context_recall])
print(results)
```
