# OpenAI — Fundamentals

## Chat Completions API

```python
from openai import OpenAI
import json

client = OpenAI()

# Structured output with JSON mode
response = client.chat.completions.create(
    model="gpt-4o-mini",
    response_format={"type": "json_object"},
    messages=[
        {"role": "system", "content": "Extract info as JSON. Schema: {name, age, skills: []}"},
        {"role": "user", "content": "Alice is 28, she knows Python, AWS, and Kubernetes"}
    ]
)
data = json.loads(response.choices[0].message.content)
# {"name": "Alice", "age": 28, "skills": ["Python", "AWS", "Kubernetes"]}

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
    model="gpt-4o",
    messages=[{"role": "user", "content": "What's the weather in Bangalore?"}],
    tools=tools,
    tool_choice="auto"
)

if response.choices[0].finish_reason == "tool_calls":
    tool_call = response.choices[0].message.tool_calls[0]
    args = json.loads(tool_call.function.arguments)
    # {"location": "Bangalore", "unit": "celsius"}
    
    weather = get_real_weather(args["location"])
    
    # Continue conversation with tool result
    messages = [
        {"role": "user", "content": "What's the weather in Bangalore?"},
        response.choices[0].message,  # Assistant message with tool call
        {"role": "tool", "tool_call_id": tool_call.id, "content": weather}
    ]
    final = client.chat.completions.create(model="gpt-4o", messages=messages)
    print(final.choices[0].message.content)
```

## Embeddings

```python
# Generate embeddings for semantic search and RAG
response = client.embeddings.create(
    model="text-embedding-3-small",
    input=["Kubernetes deployment", "Docker container", "AWS EC2 instance"]
)

embeddings = [e.embedding for e in response.data]
# Each embedding is a list of 1536 floats

# Cosine similarity for comparison
import numpy as np
def cosine_similarity(a, b):
    return np.dot(a, b) / (np.linalg.norm(a) * np.linalg.norm(b))

# Find most similar
query = client.embeddings.create(model="text-embedding-3-small", input="container orchestration").data[0].embedding
similarities = [cosine_similarity(query, e) for e in embeddings]
most_similar = max(range(len(similarities)), key=lambda i: similarities[i])
print(f"Most similar: {['Kubernetes deployment', 'Docker container', 'AWS EC2'][most_similar]}")
```
