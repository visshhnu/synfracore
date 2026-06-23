# OpenAI API Certification Guide

## Certifications Available

| Cert / Course | Provider | Cost | Format |
|---------------|----------|------|--------|
| **Azure AI Engineer (AI-102)** | Microsoft | $165 | MCQ — covers Azure OpenAI |
| **DeepLearning.AI Prompt Engineering** | DL.AI/OpenAI | Free | Practical notebooks |
| **AWS Certified ML Specialty** | AWS | $300 | MCQ — covers SageMaker + Bedrock |

---

## OpenAI API — Core Patterns

```python
from openai import OpenAI
client = OpenAI()  # reads OPENAI_API_KEY from environment

# CHAT COMPLETIONS
response = client.chat.completions.create(
    model="gpt-4o",
    messages=[
        {"role": "system", "content": "You are a helpful coding assistant."},
        {"role": "user", "content": "Write a Python function to reverse a string"},
    ],
    temperature=0.3,     # 0=deterministic, 1=balanced, 2=creative
    max_tokens=500,
)
print(response.choices[0].message.content)
print(f"Tokens: {response.usage.total_tokens}")

# STREAMING
stream = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[{"role": "user", "content": "Tell me a story"}],
    stream=True,
)
for chunk in stream:
    if chunk.choices[0].delta.content is not None:
        print(chunk.choices[0].delta.content, end="", flush=True)

# FUNCTION CALLING / TOOL USE
tools = [{
    "type": "function",
    "function": {
        "name": "get_weather",
        "description": "Get current weather for a city",
        "parameters": {
            "type": "object",
            "properties": {
                "city": {"type": "string"},
                "units": {"type": "string", "enum": ["celsius", "fahrenheit"]},
            },
            "required": ["city"],
        },
    }
}]
response = client.chat.completions.create(
    model="gpt-4o", messages=[{"role": "user", "content": "Weather in Mumbai?"}],
    tools=tools, tool_choice="auto",
)
tool_call = response.choices[0].message.tool_calls[0]
# tool_call.function.name = "get_weather"
# tool_call.function.arguments = '{"city": "Mumbai"}'

# EMBEDDINGS
embedding = client.embeddings.create(
    input="LangChain is a framework for LLM applications",
    model="text-embedding-3-small"
)
vector = embedding.data[0].embedding  # list of 1536 floats

# STRUCTURED OUTPUT (Pydantic)
from pydantic import BaseModel
class Analysis(BaseModel):
    sentiment: str
    confidence: float
    key_points: list[str]

response = client.beta.chat.completions.parse(
    model="gpt-4o",
    messages=[{"role": "user", "content": "Analyse: Great product!"}],
    response_format=Analysis,
)
result = response.choices[0].message.parsed
```

---

## Model Selection Guide

| Model | Best For | Input/Output cost per 1M tokens |
|-------|----------|----------------------------------|
| gpt-4o | Best overall, vision, complex reasoning | $5 / $15 |
| gpt-4o-mini | 80% quality, 10x cheaper | $0.15 / $0.60 |
| o1 | Complex reasoning, math | $15 / $60 |
| o1-mini | Reasoning, faster/cheaper | $3 / $12 |
| text-embedding-3-small | Embeddings (fast, cheap) | $0.02 |
| text-embedding-3-large | Best quality embeddings | $0.13 |
| whisper-1 | Speech to text | $0.006/min |
| dall-e-3 | Image generation | $0.04-0.12/image |

---

## Azure OpenAI (AI-102 focus)

```python
from openai import AzureOpenAI

client = AzureOpenAI(
    azure_endpoint="https://myresource.openai.azure.com/",
    api_key="...",
    api_version="2024-02-01"
)
response = client.chat.completions.create(
    model="gpt-4o",          # your deployment name in Azure
    messages=[{"role": "user", "content": "Hello"}]
)
# Azure adds: content filtering, private networking, VNET, compliance
```

## Study Resources

- **OpenAI Cookbook** (cookbook.openai.com) — practical examples, free
- **DeepLearning.AI short courses** — prompt engineering, function calling (free)
- **OpenAI API docs** (platform.openai.com/docs) — always current
- **Microsoft Learn** — AI-102 learning path (free labs + sandbox)

## Revision Notes
```
CHAT COMPLETIONS: messages array → system/user/assistant roles
temperature: 0=deterministic (structured tasks) | 1=balanced | 2=creative

FUNCTION CALLING:
  Define JSON schema → model returns {name, arguments} → execute → feed back
  tool_choice: "auto" (model decides) | "required" | specific function name

STRUCTURED OUTPUT: client.beta.chat.completions.parse + Pydantic
  Guarantees JSON matching your schema — no parsing errors

MODELS: gpt-4o (quality) | gpt-4o-mini (cost) | o1 (reasoning)
EMBEDDINGS: 1536 dims (small) | 3072 dims (large) — use for RAG/search

RATE LIMITS: handle 429 with exponential backoff
TOKEN COSTS: input < output — keep prompts efficient
```
