# LangChain — Advanced

## LangGraph State Machines

```python
# pip install langgraph
from langgraph.graph import StateGraph, END
from typing import TypedDict, Annotated
import operator

class ResearchState(TypedDict):
    question: str
    search_results: list[str]
    draft: str
    critique: str
    final_answer: str
    iteration: int

def search_node(state: ResearchState) -> dict:
    """Search for information."""
    from langchain_community.tools import DuckDuckGoSearchRun
    search = DuckDuckGoSearchRun()
    results = [search.run(state["question"])]
    return {"search_results": results, "iteration": state.get("iteration", 0) + 1}

def draft_node(state: ResearchState) -> dict:
    """Draft an answer based on search results."""
    context = "\n".join(state["search_results"])
    prompt = f"Based on:\n{context}\n\nAnswer: {state['question']}"
    response = llm.invoke(prompt)
    return {"draft": response.content}

def critique_node(state: ResearchState) -> dict:
    """Critique the draft."""
    prompt = f"Critique this answer for accuracy and completeness:\n{state['draft']}\n\nIs it good enough? Reply 'APPROVED' or list issues."
    response = llm.invoke(prompt)
    return {"critique": response.content}

def should_revise(state: ResearchState) -> str:
    if "APPROVED" in state["critique"] or state["iteration"] >= 3:
        return "finalize"
    return "search"  # Search more and revise

def finalize_node(state: ResearchState) -> dict:
    return {"final_answer": state["draft"]}

# Build the graph
workflow = StateGraph(ResearchState)
workflow.add_node("search", search_node)
workflow.add_node("draft", draft_node)
workflow.add_node("critique", critique_node)
workflow.add_node("finalize", finalize_node)

workflow.set_entry_point("search")
workflow.add_edge("search", "draft")
workflow.add_edge("draft", "critique")
workflow.add_conditional_edges("critique", should_revise, {
    "search": "search",
    "finalize": "finalize"
})
workflow.add_edge("finalize", END)

app = workflow.compile()
result = app.invoke({"question": "What is the latest Kubernetes version?", "iteration": 0})
print(result["final_answer"])
```

## LangChain Cheatsheet + Interview

```python
# ── LCEL OPERATORS ────────────────────────────────────────
chain = prompt | llm | parser          # Pipe: pass output to next
chain = prompt | llm.bind(stop=["---"]) # Bind: add fixed params
chain = RunnablePassthrough() | llm    # PassThrough: forward input unchanged
chain = {"a": chain1, "b": chain2}    # Dict: run multiple chains

# ── COMMON COMPONENTS ─────────────────────────────────────
from langchain.prompts import (
    ChatPromptTemplate,                 # Multi-turn prompt
    PromptTemplate,                     # Simple string template
    FewShotPromptTemplate,              # With examples
)
from langchain.schema.output_parser import (
    StrOutputParser,                    # Raw text
    JsonOutputParser,                   # Parse JSON
    CommaSeparatedListOutputParser,     # List
)
from langchain.callbacks import get_openai_callback  # Token counting

# ── KEY INTERVIEW QUESTIONS ────────────────────────────────
# What is LCEL (LangChain Expression Language)?
# → A composable pipeline syntax using | to chain components.
# → Supports streaming, batch, async, parallel execution.
# → Each component is a Runnable with .invoke/.stream/.batch

# When would you use LangChain vs raw API calls?
# → LangChain: complex chains, RAG apps, agents, multi-model support
# → Raw API: simple single calls, maximum control, minimal dependencies
# → LangChain adds overhead but saves boilerplate for complex workflows

# What is a retriever in LangChain?
# → Any object that returns documents given a query string
# → Implements .get_relevant_documents(query)
# → Can wrap any vector store, keyword search, or custom logic
```
