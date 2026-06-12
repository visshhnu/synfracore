# AI Agents — Fundamentals

## What is an Agent

```
Agent = LLM + Tools + Memory + Reasoning loop

LLM alone: Input → Output (one shot)
Agent:     Input → Plan → Tool call → Observe → Plan → Tool call → ... → Output

ReAct pattern (Reasoning + Acting):
  Thought: I need to check current stock price
  Action:  search_web("AAPL stock price today")
  Observation: Apple (AAPL): $185.92 (+1.2%)
  Thought: Now I have the price, I can answer
  Output: Apple's current stock price is $185.92
```

## Tool Use with Claude

```python
from anthropic import Anthropic
import subprocess, json

client = Anthropic()

# Define tools
tools = [
    {
        "name": "run_bash",
        "description": "Execute a bash command on the server. Use for checking system status, files, running scripts.",
        "input_schema": {
            "type": "object",
            "properties": {
                "command": {
                    "type": "string",
                    "description": "Bash command to execute"
                }
            },
            "required": ["command"]
        }
    },
    {
        "name": "read_file",
        "description": "Read contents of a file",
        "input_schema": {
            "type": "object",
            "properties": {
                "path": {"type": "string", "description": "Absolute file path"}
            },
            "required": ["path"]
        }
    }
]

# Tool execution
def execute_tool(name: str, inputs: dict) -> str:
    if name == "run_bash":
        result = subprocess.run(
            inputs["command"], shell=True,
            capture_output=True, text=True, timeout=30
        )
        return result.stdout + result.stderr
    elif name == "read_file":
        try:
            return open(inputs["path"]).read()
        except Exception as e:
            return f"Error: {e}"
    return f"Unknown tool: {name}"

# Agentic loop
def run_agent(user_message: str) -> str:
    messages = [{"role": "user", "content": user_message}]

    while True:
        response = client.messages.create(
            model="claude-sonnet-4-6",
            max_tokens=4096,
            tools=tools,
            messages=messages
        )

        # Append assistant response
        messages.append({"role": "assistant", "content": response.content})

        # Check if done
        if response.stop_reason == "end_turn":
            return next(b.text for b in response.content if hasattr(b, 'text'))

        # Execute tool calls
        if response.stop_reason == "tool_use":
            tool_results = []
            for block in response.content:
                if block.type == "tool_use":
                    result = execute_tool(block.name, block.input)
                    tool_results.append({
                        "type": "tool_result",
                        "tool_use_id": block.id,
                        "content": result
                    })

            messages.append({"role": "user", "content": tool_results})

# Example usage
answer = run_agent("Check disk usage and tell me if any partitions are above 80%")
print(answer)
```

## Memory Types

```python
# 1. In-context memory — conversation history in the prompt
messages = []  # Grows with each turn

# 2. External memory — store and retrieve from database
import json

class AgentMemory:
    def __init__(self, storage_path="memory.json"):
        self.path = storage_path
        try:
            self.memories = json.load(open(storage_path))
        except:
            self.memories = []

    def save(self, content: str, metadata: dict = {}):
        self.memories.append({"content": content, "meta": metadata})
        json.dump(self.memories, open(self.path, 'w'))

    def recall(self, query: str, limit: int = 3) -> list[str]:
        # Simple keyword search (use embeddings for semantic search)
        query_words = set(query.lower().split())
        scored = []
        for mem in self.memories:
            mem_words = set(mem["content"].lower().split())
            score = len(query_words & mem_words)
            if score > 0:
                scored.append((score, mem["content"]))
        scored.sort(reverse=True)
        return [content for _, content in scored[:limit]]

# 3. Episodic memory — store task outcomes
# "When I ran kubectl apply last time, I forgot to --dry-run first. Always dry-run first."
```

## Multi-Agent Systems

```python
# Orchestrator pattern — one agent delegates to specialists
orchestrator_prompt = """You are an orchestrator. For each task:
1. Break it into subtasks
2. Assign to the right specialist agent:
   - 'researcher': For gathering information
   - 'coder': For writing/debugging code
   - 'writer': For documentation and reports
Return JSON: {"subtasks": [{"agent": "...", "task": "..."}]}"""

# Specialist agents each have focused tools and system prompts
researcher_tools = [web_search, read_url]
coder_tools = [run_code, read_file, write_file]
writer_tools = [read_file, write_file]
```
