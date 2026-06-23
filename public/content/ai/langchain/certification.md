# LangChain Certification Guide

## Certifications Available

| Resource | Type | Cost | Link |
|----------|------|------|------|
| **LangChain Academy** | Free course + certificate | Free | academy.langchain.com |
| **DeepLearning.AI LangChain Dev** | Course certificate | Free | learn.deeplearning.ai |
| **DeepLearning.AI LangGraph** | Course certificate | Free | learn.deeplearning.ai |
| **AWS ML Specialty** | Formal cert covering RAG/agents | $300 | AWS |

---

## LangChain Core — Must-Know Code

```python
from langchain_openai import ChatOpenAI
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser
from langchain_core.runnables import RunnablePassthrough

# BASIC CHAIN (LCEL pipe syntax)
llm = ChatOpenAI(model="gpt-4o-mini", temperature=0)
prompt = ChatPromptTemplate.from_template("Translate to French: {text}")
chain = prompt | llm | StrOutputParser()
result = chain.invoke({"text": "Hello world"})

# RUNNABLE METHODS
chain.invoke({"text": "Hello"})                    # single call
chain.batch([{"text": "Hi"}, {"text": "Bye"}])     # parallel batch
for chunk in chain.stream({"text": "Hello"}):      # streaming
    print(chunk, end="")
await chain.ainvoke({"text": "Hello"})             # async

# RAG PIPELINE
from langchain_community.document_loaders import PyPDFLoader
from langchain_text_splitters import RecursiveCharacterTextSplitter
from langchain_openai import OpenAIEmbeddings
from langchain_community.vectorstores import Chroma

# 1. Load and split
docs = PyPDFLoader("doc.pdf").load()
chunks = RecursiveCharacterTextSplitter(
    chunk_size=1000, chunk_overlap=200
).split_documents(docs)

# 2. Embed and store
vectorstore = Chroma.from_documents(
    chunks, OpenAIEmbeddings(model="text-embedding-3-small")
)
retriever = vectorstore.as_retriever(search_kwargs={"k": 4})

# 3. RAG chain
rag_prompt = ChatPromptTemplate.from_template("""
Answer using only the context below.

Context: {context}
Question: {question}
""")

def format_docs(docs):
    return "\n\n".join(d.page_content for d in docs)

rag_chain = (
    {"context": retriever | format_docs, "question": RunnablePassthrough()}
    | rag_prompt | llm | StrOutputParser()
)
answer = rag_chain.invoke("What is the main topic?")

# STRUCTURED OUTPUT
from pydantic import BaseModel
class Analysis(BaseModel):
    sentiment: str
    confidence: float
    key_points: list[str]

structured = llm.with_structured_output(Analysis)
result = structured.invoke("Analyse: Great product!")

# CONVERSATION MEMORY
from langchain_core.chat_history import InMemoryChatMessageHistory
from langchain_core.runnables.history import RunnableWithMessageHistory

store = {}
def get_history(session_id: str):
    if session_id not in store:
        store[session_id] = InMemoryChatMessageHistory()
    return store[session_id]

chain_with_memory = RunnableWithMessageHistory(chain, get_history)
```

---

## LangGraph — Stateful Agents

```python
from langgraph.graph import StateGraph, END
from langgraph.prebuilt import ToolNode
from typing import TypedDict, Annotated
from langchain_core.messages import BaseMessage
import operator

class State(TypedDict):
    messages: Annotated[list[BaseMessage], operator.add]

llm_with_tools = ChatOpenAI(model="gpt-4o").bind_tools(tools)

def call_model(state: State):
    return {"messages": [llm_with_tools.invoke(state["messages"])]}

def should_continue(state: State):
    last = state["messages"][-1]
    if hasattr(last, "tool_calls") and last.tool_calls:
        return "tools"
    return END

graph = StateGraph(State)
graph.add_node("agent", call_model)
graph.add_node("tools", ToolNode(tools))
graph.set_entry_point("agent")
graph.add_conditional_edges("agent", should_continue)
graph.add_edge("tools", "agent")
app = graph.compile()

# Run
result = app.invoke({"messages": [("user", "Search for latest AI news")]})
```

---

## Study Resources

- **LangChain Academy** (academy.langchain.com) — free, official, structured courses
- **DeepLearning.AI short courses** — LangChain + LangGraph (free, 1 hr each)
- **LangChain Python docs** (python.langchain.com) — always up to date
- **LangSmith docs** — for tracing and evaluation

## Revision Notes
```
LCEL: pipe operator | composes runnables
  prompt | llm | parser  (left to right execution)
  Runnable: invoke / stream / batch / ainvoke / astream

RAG STEPS (must memorise):
  Load (PyPDFLoader) → Split (RecursiveCharacterTextSplitter)
  → Embed (OpenAIEmbeddings) → Store (Chroma/FAISS)
  → Retrieve (as_retriever) → Generate (prompt | llm | parser)

LANGGRAPH vs LANGCHAIN AGENTS:
  LangChain AgentExecutor: simpler, less control
  LangGraph StateGraph: explicit state, conditional routing, more robust

LANGSMITH: tracing (see every call) + datasets (test cases) + evals
  Set LANGCHAIN_TRACING_V2=true to auto-trace all chains

KEY CLASSES: ChatOpenAI | ChatPromptTemplate | FAISS/Chroma
  StrOutputParser | JsonOutputParser | PydanticOutputParser
  RunnableWithMessageHistory | ConversationChain
```
