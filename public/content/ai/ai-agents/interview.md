# AI Agents Interview Questions

## Core Concepts

**Q: What is an AI agent? How is it different from a simple LLM call?**

**Simple LLM call**: Single input → Single output. Stateless. No actions.
```
User: "What is 2+2?" → LLM → "4"
```

**AI Agent**: LLM + tools + memory + reasoning loop. Can take actions, observe results, iterate.
```
User: "Book a meeting with Alice tomorrow at 3pm"
Agent: Check Alice's calendar → Check my calendar → Find conflicts → Create event → Send invite → Confirm
```

**Key properties of agents:**
- **Reasoning**: Plans multi-step to achieve goal
- **Tool use**: Calls external functions (search, APIs, databases, code execution)
- **Memory**: Maintains state across steps (working memory) and sessions (persistent memory)
- **Autonomy**: Decides when it's done (or when to ask for help)

---

**Q: Explain the ReAct pattern. What is LangGraph?**

**ReAct (Reason + Act)**: Agent alternates between Thought (reasoning) and Action (tool call).

```
Thought: I need to check the weather in London
Action: weather_api("London")
Observation: 18°C, partly cloudy
Thought: Now I can answer the user
Answer: London is currently 18°C with partly cloudy skies.
```

LLM generates "Thought:" → executes "Action:" → observes result → generates next Thought. Loop until final answer.

**LangGraph**: Framework for building stateful, multi-step agents as directed graphs.
- **Nodes**: Functions (LLM calls, tool calls, custom logic)
- **Edges**: Control flow between nodes (conditional branching)
- **State**: Shared dict that flows through the graph

```python
from langgraph.graph import StateGraph

class AgentState(TypedDict):
    messages: list
    next_action: str

def agent_node(state: AgentState):
    # LLM decides next action
    response = llm.invoke(state["messages"])
    return {"messages": [..., response], "next_action": response.tool_calls[0].name}

def tool_node(state: AgentState):
    # Execute tool call
    result = execute_tool(state["next_action"])
    return {"messages": [..., result]}

graph = StateGraph(AgentState)
graph.add_node("agent", agent_node)
graph.add_node("tools", tool_node)
graph.add_edge("agent", "tools")    # Always call tools after agent
graph.add_conditional_edges("tools", should_continue, {"continue": "agent", "end": END})
```

---

**Q: Agent memory types.**

**Short-term (within session):**
- Conversation history (last N messages)
- Scratchpad (working memory for current task)
- Tool outputs

**Long-term (across sessions):**
- Vector store: store embeddings of past interactions, retrieve relevant memories
- SQL/key-value: structured facts about user (name, preferences, history)
- Episodic: summaries of past conversations

**Implementation:**
```python
# Short-term: conversation buffer
memory = ConversationBufferWindowMemory(k=10)  # Last 10 exchanges

# Long-term: vector store memory
memory = VectorStoreRetrieverMemory(retriever=vectorstore.as_retriever(k=5))
```

---

**Q: Multi-agent systems — when and how?**

Single agent limitations: Context window fills up, can't parallelize, one role is too broad.

**Multi-agent patterns:**

**Supervisor + Workers**: Supervisor agent decomposes task → routes to specialist agents → aggregates results.
```
User query → Supervisor → Research Agent (web search)
                       → Analysis Agent (data processing)
                       → Writer Agent (draft answer)
          ← Supervisor aggregates
```

**Sequential pipeline**: Each agent's output is next agent's input.
```
Planner → Researcher → Critic → Writer → Editor
```

**Debate/Critique**: Two agents (proposer + critic) improve quality through disagreement.

**Framework**: CrewAI, LangGraph (multi-agent), AutoGen.

---

**Q: Agent failure modes and how to handle them.**

**Infinite loops**: Agent keeps calling tools, never terminates.
Fix: max_iterations limit, detect repeated actions, human-in-the-loop checkpoint.

**Tool errors**: External API fails, returns unexpected format.
Fix: Tool error handling, retry with backoff, fallback tools.

**Hallucinated tool calls**: Agent invents tool names or parameters.
Fix: Strict tool schema validation, function calling with type hints.

**Context overflow**: Long agent runs exceed context window.
Fix: Summarise intermediate results, use external memory, compress observations.

**Prompt injection via tool results**: Tool returns malicious instruction.
Fix: Treat tool outputs as untrusted data, don't execute raw tool results as instructions.

## Revision Notes
```
AGENT = LLM + Tools + Memory + Reasoning Loop
Properties: Reason, Tool Use, Memory, Autonomy

REACT: Thought → Action → Observation → repeat
LANGGRAPH: State + Nodes + Edges. Directed graph for agent control flow.

MEMORY:
Short-term: conversation history, scratchpad, tool outputs
Long-term: vector store (semantic), SQL (structured), episodic (summaries)

MULTI-AGENT:
Supervisor+Workers: decompose → route → aggregate
Sequential pipeline: each agent feeds next
Debate: proposer + critic improves quality
Frameworks: CrewAI, LangGraph, AutoGen

FAILURE MODES:
Infinite loops → max_iterations | Tool errors → retry + fallback
Context overflow → summarise + compress | Injection → treat tool output as untrusted
```
