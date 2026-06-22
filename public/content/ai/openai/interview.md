# OpenAI API Interview Questions

## Core Concepts

**Q: Chat completions API**

```python
from openai import OpenAI
client = OpenAI()

response = client.chat.completions.create(
    model="gpt-4o-mini",    # gpt-4o (best) | gpt-4o-mini (33x cheaper) | o1 (reasoning)
    messages=[
        {"role": "system", "content": "You are a DevOps expert."},
        {"role": "user", "content": "Explain Kubernetes pods"}
    ],
    temperature=0.7,        # 0=deterministic, 2=creative
    max_tokens=1000,
)
print(response.choices[0].message.content)
print(response.usage)  # prompt_tokens, completion_tokens, total_tokens
```

**Q: Function calling**

```python
tools = [{"type": "function", "function": {
    "name": "get_weather", "description": "Get weather for a city",
    "parameters": {"type": "object",
        "properties": {"city": {"type": "string"}}, "required": ["city"]}}}]

# Round 1: LLM decides to call function
resp = client.chat.completions.create(model="gpt-4o-mini", messages=msgs, tools=tools)
tool_call = resp.choices[0].message.tool_calls[0]
result = get_weather(json.loads(tool_call.function.arguments)["city"])

# Round 2: provide result, get final answer
msgs += [resp.choices[0].message,
    {"role": "tool", "tool_call_id": tool_call.id, "content": json.dumps(result)}]
final = client.chat.completions.create(model="gpt-4o-mini", messages=msgs)
```

**Q: Structured output and embeddings**

```python
from pydantic import BaseModel

class Info(BaseModel):
    company: str
    technologies: list[str]

# Guaranteed JSON matching Pydantic schema
resp = client.beta.chat.completions.parse(
    model="gpt-4o-mini", messages=[...], response_format=Info)
data = resp.choices[0].message.parsed

# Embeddings for RAG
emb = client.embeddings.create(
    input=["Kubernetes is container orchestration"],
    model="text-embedding-3-small").data[0].embedding   # 1536-dim vector
```

**Q: Production best practices**

```python
import backoff
from openai import RateLimitError

@backoff.on_exception(backoff.expo, RateLimitError, max_tries=5)
def call_llm(msgs): return client.chat.completions.create(...)

# Streaming for responsive UX
for chunk in client.chat.completions.create(..., stream=True):
    if chunk.choices[0].delta.content:
        print(chunk.choices[0].delta.content, end="")
```

Rules: retry on rate limits, stream for UX, log token usage, semantic cache with Redis, sanitise input (prompt injection), use mini models (33x cheaper than gpt-4o).

## Revision Notes
```
MODELS: gpt-4o (best) | gpt-4o-mini (33x cheaper) | o1 (reasoning)
text-embedding-3-small (1536d) | text-embedding-3-large (3072d, higher quality)

CHAT: messages=[system/user/assistant/tool] | temperature | max_tokens
JSON MODE: response_format={"type":"json_object"}
FUNCTION CALLING: tools list -> LLM calls -> execute -> append result -> final
STRUCTURED OUTPUT: beta.chat.completions.parse + Pydantic model (guaranteed schema)
EMBEDDINGS: .embeddings.create -> vector -> cosine similarity -> RAG

PRODUCTION:
Retry with backoff | Stream for UX | Log token usage
Semantic cache | Sanitise user input | Use mini models
```
