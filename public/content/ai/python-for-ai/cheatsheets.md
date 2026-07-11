# Python Foundations for AI — Quick Reference

## JSON handling

```python
import json

data = json.loads(response_text)       # string -> Python dict/list
text = json.dumps(data, indent=2)       # Python object -> pretty string
value = data.get("key", "default")      # safe access, no KeyError
```

## Basic API call pattern

```python
import os
from anthropic import Anthropic

client = Anthropic(api_key=os.environ["ANTHROPIC_API_KEY"])

response = client.messages.create(
    model="claude-sonnet-4-6",
    max_tokens=500,
    messages=[{"role": "user", "content": "Your prompt here"}],
)
print(response.content[0].text)
```

## Streaming

```python
with client.messages.stream(
    model="claude-sonnet-4-6", max_tokens=1000,
    messages=[{"role": "user", "content": prompt}],
) as stream:
    for text in stream.text_stream:
        print(text, end="", flush=True)   # flush=True matters, see Troubleshooting
```

## Retry with exponential backoff

```python
import time

def call_with_retry(fn, max_retries=3):
    for attempt in range(max_retries):
        try:
            return fn()
        except Exception:
            if attempt == max_retries - 1:
                raise
            time.sleep(2 ** attempt)
```

## Cosine similarity (embeddings)

```python
import numpy as np

def cosine_similarity(a: np.ndarray, b: np.ndarray) -> float:
    return np.dot(a, b) / (np.linalg.norm(a) * np.linalg.norm(b))
```

## Async concurrent calls

```python
import asyncio

async def call_many(prompts: list[str]) -> list[str]:
    return await asyncio.gather(*[call_one(p) for p in prompts])
```

## Common error codes, quick reference

| Code/Error | Usual cause |
|---|---|
| `401` | Missing/invalid API key |
| `429` | Rate limited (requests or tokens per minute) |
| `KeyError` on response | Accessing a field that's conditionally present, or an error-response shape |
| `nan` from cosine similarity | Zero vector — usually a silently-failed embedding upstream |
| Async code hangs | Missing `await`, or blocking sync call inside async function |

## Terminology quick reference

| Term | Meaning |
|---|---|
| Embedding | A vector representation of text, used for semantic similarity |
| RAG | Retrieval-Augmented Generation — retrieve relevant context, then generate an answer using it |
| Agent loop | Model calls a tool, gets a result, continues — repeated until a final answer |
| Context window | The maximum tokens (input + output) a model call can handle |
| Structured output | Constraining model output to a specific schema, instead of free text |
| Prompt caching | Reusing billed context across calls instead of re-paying for repeated content |
