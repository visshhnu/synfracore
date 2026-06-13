# AI Fundamentals — Cheatsheet

```python
# ── ANTHROPIC CLAUDE ──────────────────────────────────────
import anthropic
client = anthropic.Anthropic()  # ANTHROPIC_API_KEY env var

# Models (2025)
# claude-opus-4-6:        $15/$75 per 1M tokens  — most capable
# claude-sonnet-4-6:      $3/$15 per 1M tokens   — recommended default
# claude-haiku-4-5-20251001: $0.25/$1.25          — fastest/cheapest

# Basic call
r = client.messages.create(
    model="claude-sonnet-4-6",
    max_tokens=1024,
    system="You are a helpful assistant.",
    messages=[{"role": "user", "content": "Hello"}]
)
text = r.content[0].text
print(f"In: {r.usage.input_tokens}, Out: {r.usage.output_tokens}")

# Multi-turn conversation
messages = [
    {"role": "user", "content": "What is Docker?"},
    {"role": "assistant", "content": "Docker is a containerization platform..."},
    {"role": "user", "content": "How does it compare to VMs?"}
]
r = client.messages.create(model="claude-sonnet-4-6", max_tokens=1024, messages=messages)

# Streaming
with client.messages.stream(
    model="claude-sonnet-4-6", max_tokens=1024,
    messages=[{"role": "user", "content": "Write a long essay"}]
) as stream:
    for chunk in stream.text_stream:
        print(chunk, end="", flush=True)

# Vision
import base64
img = base64.b64encode(open("image.png","rb").read()).decode()
r = client.messages.create(
    model="claude-sonnet-4-6", max_tokens=1024,
    messages=[{"role": "user", "content": [
        {"type": "image", "source": {"type": "base64", "media_type": "image/png", "data": img}},
        {"type": "text", "text": "Describe this image"}
    ]}]
)

# Tool use
tools = [{"name": "search", "description": "Search the web",
          "input_schema": {"type": "object", "properties": {"query": {"type": "string"}}, "required": ["query"]}}]
r = client.messages.create(model="claude-sonnet-4-6", max_tokens=1024, tools=tools,
    messages=[{"role": "user", "content": "What is the latest Kubernetes version?"}])

# ── OPENAI ────────────────────────────────────────────────
from openai import OpenAI
client = OpenAI()  # OPENAI_API_KEY env var

# Models: gpt-4o ($2.50/$10), gpt-4o-mini ($0.15/$0.60), o1 ($15/$60)
r = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[{"role": "user", "content": "Hello"}],
    temperature=0.7,
    max_tokens=500
)
text = r.choices[0].message.content

# JSON mode
r = client.chat.completions.create(
    model="gpt-4o-mini",
    response_format={"type": "json_object"},
    messages=[{"role": "system", "content": "Respond with JSON"},
              {"role": "user", "content": "List top 3 programming languages as JSON"}]
)
import json; data = json.loads(r.choices[0].message.content)

# Embeddings
r = client.embeddings.create(model="text-embedding-3-small", input=["text to embed"])
embedding = r.data[0].embedding  # list of 1536 floats

# ── KEY CONCEPTS ──────────────────────────────────────────
# Token ≈ 4 chars ≈ 0.75 words
# Temperature: 0=deterministic, 0.7=balanced, 1=creative
# Context window: max tokens in+out (Claude: 200K, GPT-4o: 128K)
# Hallucination: model generates plausible but wrong information
# RAG: inject retrieved context to ground responses in facts
# Fine-tuning: update model weights on your data (expensive)
# Prompt caching: reuse expensive context, save 90% cost
# Tool use: model requests function execution with structured args

# ── COST ESTIMATION ───────────────────────────────────────
# 1000-word essay = ~1333 tokens
# Claude Sonnet: 1333 tokens × $3/1M = $0.004 to generate
# GPT-4o-mini: 1333 tokens × $0.60/1M = $0.0008 to generate
# Cost optimization: cache repeated context, use smaller models for simple tasks
```
