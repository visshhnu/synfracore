# OpenAI — Cheatsheet

```python
from openai import OpenAI
import json, base64

client = OpenAI()  # OPENAI_API_KEY env var

# ── MODELS ────────────────────────────────────────────────
# gpt-4o:        $2.50/$10 per 1M  — multimodal, balanced
# gpt-4o-mini:   $0.15/$0.60       — cheap, fast, most tasks  ← default
# o1:            $15/$60           — multi-step reasoning, slow
# o1-mini:       $3/$12            — cheaper o1 for STEM
# gpt-3.5-turbo: legacy, use gpt-4o-mini instead

# ── CHAT COMPLETION ───────────────────────────────────────
r = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user",   "content": "What is Docker?"}
    ],
    temperature=0.7,     # 0=deterministic, 1=creative
    max_tokens=500,
    top_p=1.0,
    frequency_penalty=0, # Reduce repetition (0.5 is good)
    presence_penalty=0   # Encourage new topics
)
text = r.choices[0].message.content
tokens = r.usage.total_tokens

# Streaming
for chunk in client.chat.completions.create(
    model="gpt-4o-mini", stream=True,
    messages=[{"role": "user", "content": "Write an essay"}]
):
    print(chunk.choices[0].delta.content or "", end="", flush=True)

# JSON mode
r = client.chat.completions.create(
    model="gpt-4o-mini",
    response_format={"type": "json_object"},
    messages=[
        {"role": "system", "content": "Respond only with JSON."},
        {"role": "user", "content": "List 3 databases as JSON"}
    ]
)
data = json.loads(r.choices[0].message.content)

# ── FUNCTION CALLING ──────────────────────────────────────
tools = [{"type": "function", "function": {
    "name": "get_stock_price",
    "description": "Get current stock price",
    "parameters": {"type": "object",
        "properties": {"symbol": {"type": "string"}},
        "required": ["symbol"]}
}}]
r = client.chat.completions.create(model="gpt-4o", messages=[...], tools=tools, tool_choice="auto")

# ── EMBEDDINGS ────────────────────────────────────────────
r = client.embeddings.create(model="text-embedding-3-small", input=["Hello world"])
embedding = r.data[0].embedding  # list[float], 1536 dims

# Batch embeddings (more efficient)
texts = ["text 1", "text 2", "text 3"]
r = client.embeddings.create(model="text-embedding-3-small", input=texts)
embeddings = [item.embedding for item in r.data]

# ── VISION ────────────────────────────────────────────────
img = base64.b64encode(open("image.png","rb").read()).decode()
r = client.chat.completions.create(
    model="gpt-4o",
    messages=[{"role": "user", "content": [
        {"type": "image_url", "image_url": {"url": f"data:image/png;base64,{img}"}},
        {"type": "text", "text": "Describe this image"}
    ]}]
)

# ── DALL-E IMAGE GENERATION ───────────────────────────────
r = client.images.generate(
    model="dall-e-3",
    prompt="A kubernetes cluster architecture diagram",
    size="1024x1024",
    quality="standard",  # standard or hd
    n=1
)
image_url = r.data[0].url

# ── WHISPER (SPEECH TO TEXT) ──────────────────────────────
with open("audio.mp3", "rb") as f:
    transcript = client.audio.transcriptions.create(model="whisper-1", file=f)
print(transcript.text)
```
