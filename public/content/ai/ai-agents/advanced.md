# AI Agents — Advanced

## Multi-Agent Orchestration

```python
from anthropic import Anthropic
import asyncio
from dataclasses import dataclass

client = Anthropic()

@dataclass
class AgentMessage:
    sender: str
    recipient: str
    content: str
    task_id: str

class MultiAgentSystem:
    """Orchestrate multiple specialized agents."""
    
    def __init__(self):
        self.agents = {
            "orchestrator": self._build_orchestrator(),
            "researcher": self._build_researcher(),
            "coder": self._build_coder(),
            "reviewer": self._build_reviewer()
        }
    
    def _run_agent(self, agent_name: str, task: str, context: str = "") -> str:
        agent_config = self.agents[agent_name]
        response = client.messages.create(
            model="claude-sonnet-4-6",
            max_tokens=2048,
            system=agent_config["system"],
            messages=[{
                "role": "user",
                "content": f"{context}\n\nTask: {task}" if context else task
            }]
        )
        return response.content[0].text
    
    def _build_orchestrator(self):
        return {
            "system": """You are an orchestrator agent. Break complex tasks into subtasks.
Assign each subtask to: researcher (for gathering info), coder (for writing code), 
reviewer (for checking quality).

Output JSON: {"plan": [{"agent": "...", "task": "...", "depends_on": []}]}"""
        }
    
    def _build_researcher(self):
        return {
            "system": """You are a research agent. Gather and synthesize information.
Provide comprehensive, accurate summaries with specific details."""
        }
    
    def _build_coder(self):
        return {
            "system": """You are a coding agent. Write clean, production-quality code.
Include error handling, type hints, and docstrings. No placeholder comments."""
        }
    
    def _build_reviewer(self):
        return {
            "system": """You are a code reviewer. Check for:
1. Security vulnerabilities
2. Logic errors  
3. Performance issues
4. Missing edge cases
Output: {"approved": bool, "issues": [...], "improved_code": "..."}"""
        }
    
    def solve(self, problem: str) -> dict:
        """Coordinate agents to solve a complex problem."""
        # Step 1: Orchestrator plans
        plan_json = self._run_agent("orchestrator", problem)
        try:
            plan = json.loads(plan_json).get("plan", [])
        except:
            plan = [{"agent": "coder", "task": problem, "depends_on": []}]
        
        results = {}
        
        # Step 2: Execute tasks in dependency order
        for step in plan:
            agent = step["agent"]
            task = step["task"]
            
            # Gather context from dependencies
            context = "\n".join(
                f"Result from {dep}:\n{results.get(dep, '')}"
                for dep in step.get("depends_on", [])
                if dep in results
            )
            
            results[f"{agent}:{task[:30]}"] = self._run_agent(agent, task, context)
        
        return results


# LangGraph-style state machine agents
# pip install langgraph
from langgraph.graph import StateGraph, END
from typing import TypedDict, Annotated
import operator

class AgentState(TypedDict):
    messages: list
    iteration: int
    result: str
    should_continue: bool

def should_continue(state: AgentState) -> str:
    """Decide whether to continue or end."""
    if state["iteration"] > 10:
        return "end"
    if state.get("result"):
        return "end"
    return "continue"

workflow = StateGraph(AgentState)
workflow.add_node("agent", run_agent_step)
workflow.add_node("tools", execute_tools)
workflow.set_entry_point("agent")
workflow.add_conditional_edges("agent", should_continue, {"continue": "tools", "end": END})
workflow.add_edge("tools", "agent")
app = workflow.compile()
```

## Agent Evaluation and Safety

```python
# Evaluate agent performance
class AgentEvaluator:
    def __init__(self, agent_fn, test_cases: list[dict]):
        self.agent = agent_fn
        self.test_cases = test_cases
    
    def run(self) -> dict:
        results = []
        for case in self.test_cases:
            output = self.agent(case["input"])
            
            # Check success criteria
            passed = all(
                criterion.lower() in output.lower()
                for criterion in case.get("must_contain", [])
            )
            
            # Check safety constraints
            safe = not any(
                forbidden in output.lower()
                for forbidden in case.get("must_not_contain", [])
            )
            
            results.append({
                "input": case["input"][:50],
                "passed": passed and safe,
                "safe": safe
            })
        
        return {
            "pass_rate": sum(r["passed"] for r in results) / len(results),
            "safety_rate": sum(r["safe"] for r in results) / len(results),
        }

# Safety: limit what agents can do
ALLOWED_BASH_PREFIXES = ["ls", "cat", "grep", "find", "df", "free", "ps"]
BLOCKED_PATTERNS = ["rm -rf", "dd if=", "mkfs", "> /dev/sd"]

def safe_bash(command: str) -> str:
    for pattern in BLOCKED_PATTERNS:
        if pattern in command:
            return f"BLOCKED: Command contains dangerous pattern '{pattern}'"
    return subprocess.run(command, shell=True, capture_output=True, text=True, timeout=10).stdout
```

## Agent Cheatsheet

```python
# ── TOOL DEFINITION PATTERN ───────────────────────────────
tool = {
    "name": "tool_name",
    "description": "When to use this tool and what it does",
    "input_schema": {
        "type": "object",
        "properties": {
            "param": {"type": "string", "description": "What this param is for"}
        },
        "required": ["param"]
    }
}

# ── AGENTIC LOOP PATTERN ──────────────────────────────────
def agent_loop(task, tools, max_iter=20):
    messages = [{"role": "user", "content": task}]
    for _ in range(max_iter):
        r = client.messages.create(model="claude-sonnet-4-6",
            max_tokens=4096, tools=tools, messages=messages)
        messages.append({"role": "assistant", "content": r.content})
        if r.stop_reason == "end_turn":
            return next(b.text for b in r.content if hasattr(b, "text"))
        results = [{"type": "tool_result", "tool_use_id": b.id,
                    "content": execute(b.name, b.input)}
                   for b in r.content if b.type == "tool_use"]
        messages.append({"role": "user", "content": results})

# ── FORCE TOOL USE ────────────────────────────────────────
# Force specific tool: tool_choice={"type": "tool", "name": "search"}
# Force any tool:      tool_choice={"type": "any"}
# Let model decide:    tool_choice={"type": "auto"} (default)

# ── BEST PRACTICES ────────────────────────────────────────
# 1. Keep tools focused (one clear purpose each)
# 2. Detailed descriptions (model decides which to use)
# 3. Validate inputs before execution
# 4. Return helpful error messages on failure
# 5. Limit max iterations to prevent infinite loops
# 6. Log all tool calls for debugging
```
