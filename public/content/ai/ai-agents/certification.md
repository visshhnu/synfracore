# AI Agents Certification Guide

## Certifications Available

No dedicated "AI Agents" certification exists yet. Most relevant paths:

| Cert / Course | Provider | Cost | Relevance |
|---------------|----------|------|-----------|
| **DeepLearning.AI AI Agents in LangGraph** | Coursera/DL.AI | Free | Core agents |
| **Hugging Face Agents Course** | HF | Free | Open source agents |
| **LangChain Academy — LangGraph** | LangChain | Free | Production agents |
| **AWS Certified ML Specialty** | AWS | $300 | ML + agent systems |
| **Google Professional ML Engineer** | Google | $200 | ML + agent platforms |

---

## Agent Architecture — Core Concepts

```python
# REACT AGENT (Reason + Act + Observe)
from langchain.agents import create_react_agent, AgentExecutor
from langchain_core.tools import tool
from langchain_openai import ChatOpenAI

@tool
def search_web(query: str) -> str:
    """Search the web for current information about a topic."""
    return tavily_client.search(query)["results"][0]["content"]

@tool
def run_python(code: str) -> str:
    """Execute Python code and return the output or error."""
    return execute_in_sandbox(code)

llm = ChatOpenAI(model="gpt-4o")
executor = AgentExecutor(
    agent=create_react_agent(llm, [search_web, run_python], prompt),
    tools=[search_web, run_python],
    verbose=True,
    max_iterations=10,    # prevent infinite loops
    handle_parsing_errors=True,
)
result = executor.invoke({"input": "Find latest AI news and summarise"})

# LANGGRAPH — stateful agents with explicit flow control
from langgraph.graph import StateGraph, END
from langgraph.prebuilt import ToolNode
from typing import TypedDict, Annotated
from langchain_core.messages import BaseMessage
import operator

class State(TypedDict):
    messages: Annotated[list[BaseMessage], operator.add]

llm_with_tools = ChatOpenAI(model="gpt-4o").bind_tools([search_web])

def call_model(state: State):
    return {"messages": [llm_with_tools.invoke(state["messages"])]}

def should_continue(state: State):
    last = state["messages"][-1]
    if hasattr(last, "tool_calls") and last.tool_calls:
        return "tools"
    return END

graph = StateGraph(State)
graph.add_node("agent", call_model)
graph.add_node("tools", ToolNode([search_web]))
graph.set_entry_point("agent")
graph.add_conditional_edges("agent", should_continue)
graph.add_edge("tools", "agent")
app = graph.compile()
```

---

## Agent Design Patterns

```
PATTERN             USE CASE                       IMPLEMENTATION
────────────────────────────────────────────────────────────────────────
ReAct               General purpose tasks          LangChain AgentExecutor
Plan-and-Execute    Complex multi-step tasks       Plan first, then execute each
Multi-agent         Specialised parallel work      Orchestrator + worker agents
Reflection          Self-improvement               Agent critiques own output
RAG agent           Knowledge-augmented Q&A        Retrieval tool + LLM reasoning
CodeAct             Code generation + execution    Python REPL + iterative debug

MEMORY TYPES:
  In-context (short-term): conversation history in prompt window (limited)
  External vector DB: user facts, past interactions, long-term knowledge
  Episodic: specific past interactions stored and retrieved by similarity
  Semantic: structured facts (knowledge graph or key-value store)
```

---

## Production Checklist

```
RELIABILITY:
  max_iterations / recursion limit to prevent infinite loops
  Per-tool timeout (5-30 seconds depending on tool)
  Graceful fallback when tool fails
  Human-in-the-loop for irreversible actions (email send, payment)

SECURITY:
  Validate user input before passing to agents (prompt injection risk)
  Tool permissions: principle of least privilege
  Sandboxed code execution (no direct filesystem/network access)
  Output validation before taking consequential actions

OBSERVABILITY:
  LangSmith or Langfuse: trace every LLM call and tool invocation
  Log token usage and cost per session
  Alert on: failure rate, latency spikes, cost anomalies
```

## Revision Notes
```
AGENT vs CHAIN: chains = fixed flow, agents = dynamic tool selection

REACT LOOP: Thought (reasoning) → Action (tool call) → Observation (result) → repeat
LANGGRAPH: StateGraph with nodes + conditional edges (more control than AgentExecutor)

TOOL DESIGN:
  Clear docstring = LLM reads it to decide when to call the tool
  Return structured output (JSON) for downstream processing
  Always handle errors (return error message, not raise exception)

EVALUATION:
  Task success rate | Tool call accuracy | Step count efficiency
  Use LangSmith datasets + LLM-as-judge for automated evaluation

PRODUCTION: max_iterations + timeout + human approval for destructive actions
  Tracing (LangSmith/Langfuse) is not optional in production
```
