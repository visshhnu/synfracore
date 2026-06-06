# AI Agents — Autonomous LLM Systems

AI Agents are LLM-powered systems that can autonomously reason, plan, and take actions to complete complex tasks — going beyond simple question-answering to actually doing things in the world.

## What Makes Something an Agent?

```
Simple LLM:         User input → LLM → Text output

AI Agent:           Goal
                      │
                   Reasoning (what do I need to do?)
                      │
                   Planning (what steps? what order?)
                      │
                   Tool use (search, code, API calls)
                      │
                   Observe result
                      │
                   Reflect (did it work? what next?)
                      │
                   Final answer or next action
```

An agent has: **Memory** (what it knows), **Tools** (what it can do), **Planning** (how it decides), and **Action** (what it executes).

## Agent Architectures

### ReAct — Reason + Act

The most common pattern. The model alternates between thinking and acting.

```python
from anthropic import Anthropic
import json

client = Anthropic()

SYSTEM = """You are a DevOps agent that helps diagnose Kubernetes issues.
You have access to tools. Use them to gather information before answering.

Available tools:
- get_pods(namespace): List pods and their status
- get_logs(namespace, pod, lines=50): Get recent pod logs  
- describe_pod(namespace, pod): Get full pod details
- get_events(namespace): Get recent cluster events

Think step by step. Use tools to gather real information.
After using tools, analyze the results and provide a diagnosis.

Format your tool calls as:
<tool>get_pods</tool>
<args>{"namespace": "production"}</args>
"""

def run_agent(user_question: str, max_turns: int = 10):
    messages = [{"role": "user", "content": user_question}]

    for turn in range(max_turns):
        response = client.messages.create(
            model="claude-sonnet-4-20250514",
            max_tokens=1000,
            system=SYSTEM,
            messages=messages
        )

        assistant_text = response.content[0].text
        messages.append({"role": "assistant", "content": assistant_text})

        # Check if agent wants to use a tool
        if "<tool>" in assistant_text:
            tool_result = execute_tool(assistant_text)
            messages.append({
                "role": "user",
                "content": f"Tool result:\n{tool_result}"
            })
        else:
            # No tool call = final answer
            return assistant_text

    return "Max turns reached"

def execute_tool(text: str) -> str:
    import re
    tool_match = re.search(r'<tool>(.*?)</tool>', text)
    args_match = re.search(r'<args>(.*?)</args>', text, re.DOTALL)

    if not tool_match:
        return "No tool found"

    tool_name = tool_match.group(1).strip()
    args = json.loads(args_match.group(1)) if args_match else {}

    # Route to actual tool implementations
    tools = {
        "get_pods": get_pods,
        "get_logs": get_logs,
        "describe_pod": describe_pod,
    }

    if tool_name in tools:
        return tools[tool_name](**args)
    return f"Unknown tool: {tool_name}"
```

### Tool Use with Anthropic API

```python
import anthropic

client = anthropic.Anthropic()

# Define tools
tools = [
    {
        "name": "search_documentation",
        "description": "Search the technical documentation for answers",
        "input_schema": {
            "type": "object",
            "properties": {
                "query": {
                    "type": "string",
                    "description": "Search query"
                },
                "category": {
                    "type": "string",
                    "enum": ["kubernetes", "aws", "terraform", "docker"],
                    "description": "Documentation category"
                }
            },
            "required": ["query"]
        }
    },
    {
        "name": "run_kubectl",
        "description": "Execute a kubectl command and return the output",
        "input_schema": {
            "type": "object",
            "properties": {
                "command": {
                    "type": "string",
                    "description": "The kubectl command to run (without 'kubectl' prefix)"
                }
            },
            "required": ["command"]
        }
    }
]

def run_agent_loop(user_message: str):
    messages = [{"role": "user", "content": user_message}]

    while True:
        response = client.messages.create(
            model="claude-sonnet-4-20250514",
            max_tokens=4096,
            tools=tools,
            messages=messages
        )

        # Add assistant response to history
        messages.append({"role": "assistant", "content": response.content})

        # Check stop reason
        if response.stop_reason == "end_turn":
            # Final text response
            return next(b.text for b in response.content if hasattr(b, "text"))

        if response.stop_reason == "tool_use":
            # Process all tool calls
            tool_results = []
            for block in response.content:
                if block.type == "tool_use":
                    result = execute_tool(block.name, block.input)
                    tool_results.append({
                        "type": "tool_result",
                        "tool_use_id": block.id,
                        "content": str(result)
                    })

            # Add tool results and continue
            messages.append({"role": "user", "content": tool_results})
```

## Multi-Agent Systems

```python
# Orchestrator + Specialist agents
import anthropic

client = anthropic.Anthropic()

class DevOpsAgent:
    def __init__(self, name: str, specialty: str, system_prompt: str):
        self.name = name
        self.specialty = specialty
        self.system_prompt = system_prompt

    def run(self, task: str) -> str:
        response = client.messages.create(
            model="claude-sonnet-4-20250514",
            max_tokens=2000,
            system=self.system_prompt,
            messages=[{"role": "user", "content": task}]
        )
        return response.content[0].text

# Specialist agents
kubernetes_agent = DevOpsAgent(
    name="K8s Specialist",
    specialty="kubernetes",
    system_prompt="""You are a Kubernetes expert. Diagnose and fix K8s issues.
    Return structured JSON: {"diagnosis": "...", "fix": "...", "commands": [...]}"""
)

security_agent = DevOpsAgent(
    name="Security Auditor",
    specialty="security",
    system_prompt="""You are a cloud security expert. Review configurations for
    security issues. Return: {"issues": [{"severity": "...", "issue": "...", "fix": "..."}]}"""
)

cost_agent = DevOpsAgent(
    name="FinOps Analyst",
    specialty="cost",
    system_prompt="""You are a cloud cost optimization expert. Analyze infrastructure
    for cost savings. Return: {"savings_opportunities": [...], "estimated_monthly_savings": "..."}"""
)

class OrchestratorAgent:
    def __init__(self, specialists: list[DevOpsAgent]):
        self.specialists = {a.specialty: a for a in specialists}

    def route_task(self, user_request: str) -> str:
        # Use LLM to decide which specialist to call
        routing_response = client.messages.create(
            model="claude-sonnet-4-20250514",
            max_tokens=100,
            system=f"""Route this request to the right specialist.
            Available: {list(self.specialists.keys())}
            Return ONLY the specialty name.""",
            messages=[{"role": "user", "content": user_request}]
        )
        specialty = routing_response.content[0].text.strip().lower()

        if specialty in self.specialists:
            return self.specialists[specialty].run(user_request)
        else:
            # Handle with general response
            return f"Could not route to specialist: {specialty}"

orchestrator = OrchestratorAgent([kubernetes_agent, security_agent, cost_agent])
result = orchestrator.route_task("My pods keep getting OOMKilled")
```

## Memory Systems for Agents

```python
from dataclasses import dataclass, field
from typing import List, Dict
import json

@dataclass
class AgentMemory:
    # Short-term: current conversation
    conversation: List[Dict] = field(default_factory=list)

    # Working memory: current task context
    task_context: Dict = field(default_factory=dict)

    # Long-term: learned facts and preferences (persist to DB)
    learned_facts: List[str] = field(default_factory=list)

    def add_message(self, role: str, content: str):
        self.conversation.append({"role": role, "content": content})

    def add_fact(self, fact: str):
        if fact not in self.learned_facts:
            self.learned_facts.append(fact)

    def get_context_prompt(self) -> str:
        if not self.learned_facts:
            return ""
        facts = "\n".join(f"- {f}" for f in self.learned_facts[-10:])
        return f"\nRelevant context from previous sessions:\n{facts}\n"

    def summarize_if_long(self, max_messages: int = 20):
        """Compress old messages to save context window"""
        if len(self.conversation) <= max_messages:
            return

        to_summarize = self.conversation[:-10]  # Keep last 10
        summary_response = client.messages.create(
            model="claude-sonnet-4-20250514",
            max_tokens=300,
            messages=[{
                "role": "user",
                "content": f"Summarize this conversation concisely:\n{json.dumps(to_summarize)}"
            }]
        )
        summary = summary_response.content[0].text
        self.conversation = [
            {"role": "system", "content": f"Previous conversation summary: {summary}"}
        ] + self.conversation[-10:]
```

## Production Agent Patterns

```python
# Pattern 1: Retry with reflection
def agent_with_retry(task: str, max_attempts: int = 3) -> str:
    attempts = []

    for i in range(max_attempts):
        result = run_agent(task)

        # Validate result
        if is_valid_result(result):
            return result

        # Reflect on failure
        reflection = client.messages.create(
            model="claude-sonnet-4-20250514",
            max_tokens=200,
            messages=[{
                "role": "user",
                "content": f"""This answer was invalid: {result}
                Task: {task}
                Previous attempts: {attempts}
                What went wrong and how should I improve?"""
            }]
        )
        attempts.append({"attempt": result, "reflection": reflection.content[0].text})

    return f"Failed after {max_attempts} attempts"

# Pattern 2: Human-in-the-loop for high-stakes actions
def agent_with_approval(task: str, dangerous_actions: list[str]) -> str:
    plan = plan_task(task)

    # Check if plan includes dangerous actions
    for action in plan:
        if any(dangerous in action for dangerous in dangerous_actions):
            approval = input(f"Agent wants to: {action}\nApprove? (y/n): ")
            if approval.lower() != "y":
                return f"Action blocked by user: {action}"

    return execute_plan(plan)

# Pattern 3: Parallel agent execution
import asyncio

async def run_parallel_agents(tasks: list[str]) -> list[str]:
    async def run_single(task):
        # Async API call
        import asyncio
        loop = asyncio.get_event_loop()
        return await loop.run_in_executor(None, run_agent, task)

    results = await asyncio.gather(*[run_single(t) for t in tasks])
    return results
```

## Interview Questions

**What is the difference between an LLM and an AI Agent?**
An LLM is a stateless model that takes input and produces output in a single forward pass — it has no memory between calls and cannot take actions. An AI Agent wraps an LLM with: a loop (the model runs multiple times), memory (conversation history and persistent storage), tools (ability to take actions like searching, executing code, calling APIs), and planning (deciding what steps to take). The LLM is the reasoning engine; the agent framework is the scaffolding that makes it autonomous.

**What is the main challenge with multi-step agents?**
Error compounding — mistakes in early steps propagate and amplify through subsequent steps. An agent that misidentifies the problem in step 1 may take 5 steps of increasingly wrong actions before failing. Solutions: add validation gates between steps, use structured outputs with error checking, implement reflection (the model evaluates its own outputs), add human approval for high-stakes actions, and set step limits to prevent infinite loops.

**How do you make agents reliable enough for production?**
Key practices: bounded autonomy (limit what tools agents can access), human-in-the-loop for irreversible or high-impact actions, comprehensive logging of every step and decision, timeout and max-step limits to prevent runaway agents, output validation before taking actions, idempotent tool implementations (safe to retry), test with adversarial inputs, monitor with traces (LangSmith, Phoenix) and set up alerts for unexpected behavior patterns.
