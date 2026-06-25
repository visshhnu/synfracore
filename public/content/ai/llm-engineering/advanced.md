# LLM Engineering Advanced

## Multi-Agent Systems with LangGraph
```python
from langgraph.graph import StateGraph, END
from typing import TypedDict

class AgentState(TypedDict):
    query: str
    docs: list
    answer: str
    attempts: int

def retrieve(state: AgentState) -> AgentState:
    state["docs"] = vectordb.search(state["query"], top_k=5)
    return state

def generate(state: AgentState) -> AgentState:
    context = "
".join(d.text for d in state["docs"])
    state["answer"] = llm.invoke(f"Context: {context}
Q: {state['query']}")
    state["attempts"] = state.get("attempts", 0) + 1
    return state

def validate(state: AgentState) -> str:
    if state["attempts"] >= 3:
        return "end"
    if len(state["answer"]) < 20:
        return "retrieve"
    return "end"

graph = StateGraph(AgentState)
graph.add_node("retrieve", retrieve)
graph.add_node("generate", generate)
graph.add_edge("retrieve", "generate")
graph.add_conditional_edges("generate", validate, {"end": END, "retrieve": "retrieve"})
graph.set_entry_point("retrieve")
app = graph.compile()

result = app.invoke({"query": "What is the LUPA threshold for PDGM wound care?"})
```

## Fine-Tuning vs RAG Decision Framework
| Scenario | Use RAG | Use Fine-tuning |
|----------|---------|----------------|
| Frequently updated knowledge | YES | No |
| Proprietary document Q&A | YES | No |
| Style/tone consistency | No | YES |
| Domain-specific reasoning | YES + FT | YES |
| Reduce hallucinations | YES | No |
| Real-time data | YES | No |
| Reduce prompt length | No | YES |

## Observability Setup
```python
from langsmith import traceable, Client
import os

os.environ["LANGCHAIN_TRACING_V2"] = "true"
os.environ["LANGCHAIN_API_KEY"] = "lsv2_..."
os.environ["LANGCHAIN_PROJECT"] = "synfracore-rag"

@traceable(run_type="chain")
def rag_pipeline(question: str) -> str:
    docs = retrieve(question)          # auto-traced
    prompt = build_prompt(docs, question)
    answer = llm.invoke(prompt)        # auto-traced
    return answer
```

## vLLM for Open-Source Model Serving
```bash
# Install and serve Llama 3.1 8B with vLLM
pip install vllm
python -m vllm.entrypoints.openai.api_server   --model meta-llama/Meta-Llama-3.1-8B-Instruct   --port 8000   --max-model-len 8192   --tensor-parallel-size 1

# Now call it like OpenAI
client = OpenAI(base_url="http://localhost:8000/v1", api_key="any")
```

## Production Checklist
- [ ] Prompt versioned and tracked in git
- [ ] Input sanitised (no prompt injection)
- [ ] Output validated (schema, length, toxicity)
- [ ] Fallback for LLM errors (retry + degraded response)
- [ ] Cost alert: budget cap per user/day
- [ ] Latency monitored: TTFT + total response time
- [ ] RAGAS scores tracked weekly
- [ ] PII scrubbing before sending to LLM API
- [ ] Rate limiting per user
- [ ] Caching layer for identical queries
