# AI Agents — Intermediate

## Multi-Tool Agents

```python
import anthropic
import subprocess, requests, json, os

client = anthropic.Anthropic()

# Define a rich tool set
tools = [
    {
        "name": "bash",
        "description": "Execute bash commands. Use for: checking system state, running scripts, file operations.",
        "input_schema": {
            "type": "object",
            "properties": {
                "command": {"type": "string", "description": "The bash command to execute"},
                "timeout": {"type": "integer", "description": "Timeout in seconds", "default": 30}
            },
            "required": ["command"]
        }
    },
    {
        "name": "read_file",
        "description": "Read contents of a file",
        "input_schema": {
            "type": "object",
            "properties": {"path": {"type": "string"}},
            "required": ["path"]
        }
    },
    {
        "name": "write_file",
        "description": "Write content to a file",
        "input_schema": {
            "type": "object",
            "properties": {
                "path": {"type": "string"},
                "content": {"type": "string"}
            },
            "required": ["path", "content"]
        }
    },
    {
        "name": "http_request",
        "description": "Make an HTTP request to an API or webhook",
        "input_schema": {
            "type": "object",
            "properties": {
                "method": {"type": "string", "enum": ["GET", "POST", "PUT", "DELETE"]},
                "url": {"type": "string"},
                "headers": {"type": "object"},
                "body": {"type": "string"}
            },
            "required": ["method", "url"]
        }
    }
]

def execute_tool(name: str, inputs: dict) -> str:
    try:
        if name == "bash":
            result = subprocess.run(
                inputs["command"], shell=True, capture_output=True,
                text=True, timeout=inputs.get("timeout", 30)
            )
            output = result.stdout + result.stderr
            return output[:5000] if output else "(no output)"

        elif name == "read_file":
            with open(inputs["path"]) as f:
                return f.read()

        elif name == "write_file":
            os.makedirs(os.path.dirname(inputs["path"]) or ".", exist_ok=True)
            with open(inputs["path"], "w") as f:
                f.write(inputs["content"])
            return f"Written to {inputs['path']}"

        elif name == "http_request":
            r = requests.request(
                method=inputs["method"],
                url=inputs["url"],
                headers=inputs.get("headers", {}),
                data=inputs.get("body"),
                timeout=10
            )
            return f"Status: {r.status_code}\n{r.text[:2000]}"

    except Exception as e:
        return f"ERROR: {str(e)}"

def run_agent(task: str, max_iterations: int = 20) -> str:
    """Run agentic loop until task complete or max iterations."""
    messages = [{"role": "user", "content": task}]
    
    for i in range(max_iterations):
        response = client.messages.create(
            model="claude-sonnet-4-6",
            max_tokens=4096,
            tools=tools,
            system="""You are an autonomous agent. Complete tasks by using the available tools.
Think step by step. After each tool call, evaluate if the task is complete.
When done, respond with a summary of what you accomplished.""",
            messages=messages
        )

        messages.append({"role": "assistant", "content": response.content})

        if response.stop_reason == "end_turn":
            return next(b.text for b in response.content if hasattr(b, "text"))

        if response.stop_reason == "tool_use":
            tool_results = []
            for block in response.content:
                if block.type == "tool_use":
                    result = execute_tool(block.name, block.input)
                    print(f"  [Tool: {block.name}] {result[:100]}")
                    tool_results.append({
                        "type": "tool_result",
                        "tool_use_id": block.id,
                        "content": result
                    })
            messages.append({"role": "user", "content": tool_results})

    return "Max iterations reached"

# Example: DevOps automation agent
result = run_agent("""
Check disk usage on this system. If any partition is over 80%, 
find the largest files and create a report at /tmp/disk-report.txt
""")
print(result)
```

## Memory Systems

```python
import json
from datetime import datetime
from pathlib import Path

class AgentMemory:
    """Persistent memory for agents across sessions."""
    
    def __init__(self, memory_file: str = "agent_memory.json"):
        self.path = Path(memory_file)
        self.data = json.loads(self.path.read_text()) if self.path.exists() else {
            "facts": [],
            "preferences": {},
            "past_tasks": [],
            "errors_learned": []
        }
    
    def save_fact(self, fact: str, category: str = "general"):
        self.data["facts"].append({
            "fact": fact,
            "category": category,
            "timestamp": datetime.now().isoformat()
        })
        self._persist()
    
    def remember_task(self, task: str, outcome: str, success: bool):
        self.data["past_tasks"].append({
            "task": task,
            "outcome": outcome,
            "success": success,
            "timestamp": datetime.now().isoformat()
        })
        if not success:
            self.data["errors_learned"].append({
                "task": task,
                "error": outcome,
                "timestamp": datetime.now().isoformat()
            })
        self._persist()
    
    def get_relevant_context(self, current_task: str) -> str:
        """Build context string from memory relevant to current task."""
        context_parts = []
        
        # Recent tasks
        recent = self.data["past_tasks"][-5:]
        if recent:
            context_parts.append("Recent tasks:\n" + "\n".join(
                f"- {'✓' if t['success'] else '✗'} {t['task']}: {t['outcome'][:100]}"
                for t in recent
            ))
        
        # Errors to avoid
        errors = self.data["errors_learned"][-3:]
        if errors:
            context_parts.append("Past errors to avoid:\n" + "\n".join(
                f"- {e['error'][:100]}" for e in errors
            ))
        
        return "\n\n".join(context_parts)
    
    def _persist(self):
        self.path.write_text(json.dumps(self.data, indent=2))
```
