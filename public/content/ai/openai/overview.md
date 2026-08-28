# OpenAI API Overview

**Before you start:** basic Python and comfort with calling a REST API (or a Python SDK wrapping one) are assumed. No prior AI/ML experience is required — everything used here is explained as it comes up.

## What is the OpenAI API?

The OpenAI API provides programmatic access to OpenAI's models including GPT-4o, GPT-4 Turbo, o1, o3, DALL-E, Whisper, and text-embedding models. It is the most widely used LLM API in production applications.

## Why This Exists (The Hook)

Training a model like GPT-4o from scratch costs many millions of dollars and requires infrastructure almost no company has. The OpenAI API is what makes that model useful to everyone else: instead of training your own, you send a request over HTTPS with your prompt, and OpenAI runs the model on their infrastructure and sends back the result — you pay only for the tokens you actually use, with zero training cost or GPU management on your end.

**Analogy** — Think of the OpenAI API like an electricity grid instead of owning a power plant. Building and running a power plant (training a foundation model) is enormous, specialized infrastructure that almost nobody needs to own directly. Instead, you plug into the grid (call the API) and pay for exactly what you consume (tokens), and the utility company (OpenAI) handles generation, maintenance, and keeping the lights on at massive scale.

**Try it (2 minutes)** — Reason through the cost math without writing any code: a typical support-ticket classification call might send 200 input tokens and receive 20 output tokens. Using the pricing table below, roughly compare the cost of running that on `gpt-4o` versus `gpt-4o-mini`. At 10,000 requests a day, does that difference matter enough to justify testing whether the cheaper model is accurate enough for the task first?

## Available Models

```conceptgrid
{
  "boxes": [
    { "title": "Chat / Text", "description": "gpt-4o, gpt-4o-mini, o1, o3-mini -- generation and reasoning", "color": "blue" },
    { "title": "Embeddings", "description": "text-embedding-3-small/large -- text to vectors, for search/RAG", "color": "purple" },
    { "title": "Image Generation", "description": "dall-e-3, dall-e-2", "color": "amber" },
    { "title": "Speech", "description": "whisper-1 (transcription), tts-1/tts-1-hd (text-to-speech)", "color": "green" }
  ]
}
```

```
CHAT / TEXT GENERATION:
  gpt-4o              — flagship multimodal, fastest GPT-4 class
  gpt-4o-mini         — affordable, fast, good for simple tasks
  o1                  — advanced reasoning (science, math, coding)
  o3-mini             — fast reasoning model
  gpt-3.5-turbo       — legacy, cheapest (mostly replaced by 4o-mini)

EMBEDDINGS:
  text-embedding-3-small  — 1536 dims, cheapest, good quality
  text-embedding-3-large  — 3072 dims, best quality
  text-embedding-ada-002  — legacy (still widely used)

IMAGE GENERATION:
  dall-e-3             — high quality, 1024x1024 to 1792x1024
  dall-e-2             — lower quality, cheaper

SPEECH:
  whisper-1            — transcription and translation (audio → text)
  tts-1                — text-to-speech (fast)
  tts-1-hd             — text-to-speech (high quality)

MODERATION:
  omni-moderation-latest — check content for policy violations (free)
```

## Core API Usage

```python
from openai import OpenAI
client = OpenAI()  # reads OPENAI_API_KEY from environment

# Chat completion
response = client.chat.completions.create(
    model="gpt-4o",
    messages=[
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": "Explain quantum entanglement simply."}
    ],
    temperature=0.7,        # 0=deterministic, 2=very random
    max_tokens=500,
    top_p=1.0,
    frequency_penalty=0.0,  # reduce word repetition
    presence_penalty=0.0,   # encourage new topics
)
print(response.choices[0].message.content)
print(f"Tokens used: {response.usage.total_tokens}")

# Streaming
stream = client.chat.completions.create(
    model="gpt-4o", messages=[{"role": "user", "content": "Tell me a story"}],
    stream=True
)
for chunk in stream:
    if chunk.choices[0].delta.content:
        print(chunk.choices[0].delta.content, end="", flush=True)

# Embeddings
embedding_response = client.embeddings.create(
    model="text-embedding-3-small",
    input="The quick brown fox jumps over the lazy dog"
)
vector = embedding_response.data[0].embedding  # list of 1536 floats

# Function calling (tool use)
tools = [{
    "type": "function",
    "function": {
        "name": "get_weather",
        "description": "Get current weather for a location",
        "parameters": {
            "type": "object",
            "properties": {
                "location": {"type": "string", "description": "City name"},
                "unit": {"type": "string", "enum": ["celsius", "fahrenheit"]}
            },
            "required": ["location"]
        }
    }
}]
response = client.chat.completions.create(
    model="gpt-4o", messages=[{"role": "user", "content": "What's the weather in London?"}],
    tools=tools, tool_choice="auto"
)
# Check if model wants to call a tool
if response.choices[0].finish_reason == "tool_calls":
    tool_call = response.choices[0].message.tool_calls[0]
    print(f"Tool: {tool_call.function.name}, Args: {tool_call.function.arguments}")

# Vision (multimodal)
response = client.chat.completions.create(
    model="gpt-4o",
    messages=[{"role": "user", "content": [
        {"type": "text", "text": "What is in this image?"},
        {"type": "image_url", "image_url": {"url": "https://example.com/image.jpg"}}
    ]}]
)
```

## Pricing and Cost Management

```
PRICING (approximate, check platform.openai.com for current):
  gpt-4o:         $2.50/M input tokens | $10/M output tokens
  gpt-4o-mini:    $0.15/M input | $0.60/M output
  o1:             $15/M input | $60/M output
  text-embedding-3-small: $0.02/M tokens

COST OPTIMIZATION:
  Use 4o-mini for simple tasks (10-20x cheaper than 4o)
  Prompt caching: repeated system prompts cached at 50% cost
  Batch API: asynchronous processing at 50% cost for non-real-time
  Set max_tokens to limit output length
  Stream responses to improve perceived latency

LIMITS:
  Rate limits: tier-based (TPM and RPM); check usage page
  Context window: 128K tokens for GPT-4o and GPT-4o-mini
  Max output: 4096 tokens (default), 16384 tokens (gpt-4o max)
```

## Study Resources
- **OpenAI documentation** (platform.openai.com/docs) — official, comprehensive
- **OpenAI Cookbook** (github.com/openai/openai-cookbook) — code examples
- **DeepLearning.AI short courses** — free practical courses using OpenAI API
- **OpenAI community forum** (community.openai.com) — troubleshooting and tips
