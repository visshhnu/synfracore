# OpenAI Platform — Building with GPT

OpenAI provides access to GPT-4, GPT-4o, DALL-E, Whisper, and embedding models through a simple REST API. It's the most widely used AI platform in the industry.

## Key Models

| Model | Best For | Context | Price (1M tokens) |
|---|---|---|---|
| **GPT-4o** | Multimodal, fast, balanced | 128K | $2.50 in / $10 out |
| **GPT-4o-mini** | Fast, cheap, most tasks | 128K | $0.15 / $0.60 |
| **GPT-4 Turbo** | Complex reasoning | 128K | $10 / $30 |
| **o1** | Multi-step reasoning, math | 128K | $15 / $60 |
| **text-embedding-3-small** | Embeddings, RAG | N/A | $0.02 |
| **whisper-1** | Speech-to-text | N/A | $0.006/min |
| **dall-e-3** | Image generation | N/A | $0.04/image |

## Quick Start

```python
# pip install openai
from openai import OpenAI

client = OpenAI()  # Uses OPENAI_API_KEY environment variable

# Text generation
response = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": "What is Docker?"}
    ],
    temperature=0.7,
    max_tokens=500
)
print(response.choices[0].message.content)
print(f"Tokens used: {response.usage.total_tokens}")

# Streaming
stream = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[{"role": "user", "content": "Write a Python function to sort a list"}],
    stream=True
)
for chunk in stream:
    if chunk.choices[0].delta.content:
        print(chunk.choices[0].delta.content, end="", flush=True)
```
