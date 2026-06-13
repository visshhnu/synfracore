# AI Fundamentals — Intermediate

## Prompt Caching and Cost Optimization

```python
import anthropic

client = anthropic.Anthropic()

# Prompt caching — reuse expensive context across calls
# Cache large system prompts, documents, few-shot examples
# Saves 90% cost + 85% latency on cached portions

# First call: WRITE to cache (small surcharge)
response = client.messages.create(
    model="claude-opus-4-6",
    max_tokens=1024,
    system=[
        {
            "type": "text",
            "text": open("large-document.txt").read(),  # 50K tokens
            "cache_control": {"type": "ephemeral"}      # Mark for caching
        },
        {
            "type": "text",
            "text": "You are a helpful assistant for the above document."
        }
    ],
    messages=[{"role": "user", "content": "What are the key conclusions?"}]
)
# Cost: 50K tokens written to cache

# Subsequent calls: READ from cache (90% cheaper!)
response2 = client.messages.create(
    model="claude-opus-4-6",
    max_tokens=1024,
    system=[
        {
            "type": "text",
            "text": open("large-document.txt").read(),
            "cache_control": {"type": "ephemeral"}   # Same content = cache hit
        },
        {
            "type": "text",
            "text": "You are a helpful assistant for the above document."
        }
    ],
    messages=[{"role": "user", "content": "Summarize chapter 3"}]
)
# Cost: ~5K tokens (cache read = 10% of write price)

print(f"Cache read tokens: {response2.usage.cache_read_input_tokens}")
print(f"Cache write tokens: {response2.usage.cache_creation_input_tokens}")
```

## Multi-Turn Conversations

```python
class ConversationManager:
    def __init__(self, system_prompt: str, max_turns: int = 20):
        self.client = anthropic.Anthropic()
        self.system = system_prompt
        self.messages = []
        self.max_turns = max_turns

    def chat(self, user_message: str) -> str:
        self.messages.append({"role": "user", "content": user_message})

        # Trim history if too long (context window management)
        if len(self.messages) > self.max_turns * 2:
            # Keep first 2 (often important) + last N messages
            self.messages = self.messages[:2] + self.messages[-(self.max_turns * 2 - 2):]

        response = self.client.messages.create(
            model="claude-sonnet-4-6",
            max_tokens=2048,
            system=self.system,
            messages=self.messages
        )

        assistant_message = response.content[0].text
        self.messages.append({"role": "assistant", "content": assistant_message})
        return assistant_message

    def reset(self):
        self.messages = []

# Usage
bot = ConversationManager("You are a DevOps expert assistant.")
print(bot.chat("What is Kubernetes?"))
print(bot.chat("How does it compare to Docker Swarm?"))
print(bot.chat("Give me a production deployment checklist"))
```

## Structured Output with Tool Use

```python
# Force structured JSON output using tool use
# More reliable than asking "respond in JSON"

tools = [{
    "name": "extract_job_info",
    "description": "Extract structured information from a job posting",
    "input_schema": {
        "type": "object",
        "properties": {
            "title": {"type": "string"},
            "company": {"type": "string"},
            "location": {"type": "string"},
            "remote": {"type": "boolean"},
            "salary_min": {"type": "number", "description": "Minimum salary in USD"},
            "salary_max": {"type": "number"},
            "required_skills": {"type": "array", "items": {"type": "string"}},
            "years_experience": {"type": "number"},
            "employment_type": {"enum": ["full-time", "part-time", "contract", "internship"]}
        },
        "required": ["title", "company", "required_skills"]
    }
}]

def extract_job_data(job_text: str) -> dict:
    response = client.messages.create(
        model="claude-sonnet-4-6",
        max_tokens=1000,
        tools=tools,
        tool_choice={"type": "tool", "name": "extract_job_info"},  # Force this tool
        messages=[{"role": "user", "content": f"Extract info from this job posting:\n\n{job_text}"}]
    )

    tool_use = next(b for b in response.content if b.type == "tool_use")
    return tool_use.input  # Always valid JSON matching the schema

result = extract_job_data("""
Senior DevOps Engineer at TechCorp, Bangalore (Hybrid)
₹25-40 LPA. 5+ years required.
Skills: Kubernetes, AWS, Terraform, Python, Jenkins
""")
print(result)
# {'title': 'Senior DevOps Engineer', 'company': 'TechCorp', ...}
```
