# Python Foundations for AI

## Why This Page Exists Separately From DevOps Python

Python-the-language is shared across every field, but *what you practice* should match your goal. The DevOps Python page is framed around infrastructure automation — `boto3`, `subprocess`, Kubernetes clients. An AI Engineer needs a different practical framing: data structures, working with JSON/APIs, and just enough numerical thinking to move into `pandas`/`numpy` and LLM SDKs comfortably. Same language, different destination — hence a dedicated page instead of reusing the infra-flavored one.

## Core Language Foundations (Fast Track)

```python
# Data types you'll use constantly when working with AI APIs
name: str = "SynfraCore"
tokens_used: int = 1284
cost_per_token: float = 0.000003
is_cached: bool = False

# Lists and dicts — the shape of almost every API response you'll parse
message = {
    "role": "user",
    "content": "Explain vector embeddings",
}
conversation: list[dict] = [message]
```

## Functions & Structuring AI Code

```python
def build_prompt(topic: str, tone: str = "concise") -> str:
    """Every AI pipeline starts with clean prompt construction."""
    return f"Explain {topic} in a {tone} way, using one real-world analogy."

def call_model(prompt: str, max_tokens: int = 500) -> str:
    # Placeholder — real implementation calls an LLM API (Anthropic, OpenAI, etc.)
    ...
```

## Working With JSON — The Universal AI API Format

Every LLM API request and response is JSON. This is the single most important practical Python skill for AI engineering:

```python
import json

response_text = '{"answer": "Embeddings map text to vectors.", "confidence": 0.92}'
data = json.loads(response_text)
print(data["answer"])   # dict access, not string parsing
```

## Object-Oriented Basics You'll Actually Use

```python
class ChatSession:
    def __init__(self, system_prompt: str):
        self.system_prompt = system_prompt
        self.history: list[dict] = []

    def add_message(self, role: str, content: str):
        self.history.append({"role": role, "content": content})
```

Most AI SDKs (Anthropic, OpenAI, LangChain) hand you client objects built exactly this way — understanding basic classes means SDK code stops looking like magic.

## Intro to NumPy (The On-Ramp to Embeddings)

```python
import numpy as np

vec_a = np.array([0.12, -0.04, 0.88])
vec_b = np.array([0.10, -0.02, 0.91])

# Cosine similarity — the core operation behind every RAG/vector search system
similarity = np.dot(vec_a, vec_b) / (np.linalg.norm(vec_a) * np.linalg.norm(vec_b))
```

This one calculation — cosine similarity between two vectors — is the mathematical heart of embeddings, semantic search, and RAG retrieval. Understanding it in plain NumPy makes every vector-database concept later much less abstract.

## Where To Go Next

Once comfortable here, move to **ML Fundamentals** (concepts) → **Prompt Engineering** → **LangChain & RAG** (application). This page is specifically the on-ramp — not a full Python course.
