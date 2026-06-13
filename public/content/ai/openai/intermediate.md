# OpenAI — Intermediate

## Assistants API (Persistent Threads)

```python
# Assistants API: stateful conversations, file upload, code interpreter

# Create an assistant (once, reuse)
assistant = client.beta.assistants.create(
    name="DevOps Expert",
    model="gpt-4o",
    instructions="You are an expert DevOps engineer. Analyze configs, write scripts, explain concepts.",
    tools=[
        {"type": "code_interpreter"},  # Can run Python code
        {"type": "file_search"}        # Can search uploaded files
    ]
)

# Upload a file (e.g., your Kubernetes configs)
with open("production.yaml", "rb") as f:
    uploaded = client.files.create(file=f, purpose="assistants")

# Create thread (one per conversation)
thread = client.beta.threads.create()

# Add message with file attachment
client.beta.threads.messages.create(
    thread_id=thread.id,
    role="user",
    content="Analyze this Kubernetes config for security issues",
    attachments=[{"file_id": uploaded.id, "tools": [{"type": "file_search"}]}]
)

# Run and wait
run = client.beta.threads.runs.create_and_poll(
    thread_id=thread.id,
    assistant_id=assistant.id
)

if run.status == "completed":
    messages = client.beta.threads.messages.list(thread_id=thread.id)
    print(messages.data[0].content[0].text.value)
```

## Vision and Multimodal

```python
import base64

# Analyze an image
with open("architecture-diagram.png", "rb") as f:
    image_data = base64.b64encode(f.read()).decode("utf-8")

response = client.chat.completions.create(
    model="gpt-4o",
    messages=[{
        "role": "user",
        "content": [
            {
                "type": "image_url",
                "image_url": {
                    "url": f"data:image/png;base64,{image_data}",
                    "detail": "high"  # "low"=faster/cheaper, "high"=detailed analysis
                }
            },
            {
                "type": "text",
                "text": "Identify all AWS services in this architecture and explain the data flow"
            }
        ]
    }],
    max_tokens=1000
)
print(response.choices[0].message.content)

# From URL (public images)
response = client.chat.completions.create(
    model="gpt-4o",
    messages=[{
        "role": "user",
        "content": [
            {"type": "image_url", "image_url": {"url": "https://example.com/diagram.png"}},
            {"type": "text", "text": "What does this diagram show?"}
        ]
    }]
)
```
