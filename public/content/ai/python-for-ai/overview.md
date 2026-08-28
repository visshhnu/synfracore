# Python Foundations for AI

**Before you start:** basic programming literacy (variables, functions, loops in any language) is assumed. No prior Python or AI experience is required — this page is the on-ramp for both.

## Why This Page Exists Separately From DevOps Python

Python-the-language is shared across every field, but *what you practice* should match your goal. The DevOps Python page is framed around infrastructure automation — `boto3`, `subprocess`, Kubernetes clients. An AI Engineer needs a different practical framing: data structures, working with JSON/APIs, and just enough numerical thinking to move into `pandas`/`numpy` and LLM SDKs comfortably. Same language, different destination — hence a dedicated page instead of reusing the infra-flavored one.

**Analogy** — Learning "Python for DevOps" versus "Python for AI" is like learning "cooking for a restaurant kitchen" versus "cooking for a bakery" — both start from the same basic knife skills and heat control, but a restaurant cook practices searing and sauces while a baker practices measuring and timing, because that's what their actual job repeatedly demands. The core skill (Python) is identical; which parts you drill are what differ.

**Try it (2 minutes)** — Before reading further, look at the `conversation: list[dict]` example below and predict: if you tried `conversation[0]["role"]`, what would it return? What about `conversation.role`? Getting this right (dict access uses brackets and a string key, not dot notation) is the single most common stumbling block for beginners parsing real LLM API responses — every OpenAI/Anthropic response is exactly this shape.

```conceptgrid
{
  "boxes": [
    { "title": "Data Types & Structures", "description": "Lists, dicts -- the shape of almost every API response you'll parse", "color": "blue" },
    { "title": "Working With JSON", "description": "Every LLM API request/response is JSON -- the universal format", "color": "purple" },
    { "title": "OOP Basics", "description": "Understand classes so SDK client objects stop looking like magic", "color": "amber" },
    { "title": "NumPy Fundamentals", "description": "Cosine similarity -- the math behind embeddings and RAG retrieval", "color": "green" }
  ]
}
```

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
