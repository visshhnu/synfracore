# LangChain Interview Questions

## Core Concepts

**Q: What is LangChain?**

LangChain is a framework for building LLM-powered applications. It provides abstractions over LLM providers, chain composition, agent frameworks, memory, and 100+ integrations.

**Q: LCEL (LangChain Expression Language)**

```python
from langchain_openai import ChatOpenAI
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser

llm = ChatOpenAI(model="gpt-4o-mini")
prompt = ChatPromptTemplate.from_messages([
    ("system", "You are a DevOps expert."),
    ("human", "{question}")
])
chain = prompt | llm | StrOutputParser()  # Pipe operator composes steps
result = chain.invoke({"question": "What is a Pod?"})

# Streaming
for chunk in chain.stream({"question": "Explain Terraform"}):
    print(chunk, end="")
```

**Q: LangChain tools and agents**

```python
from langchain_core.tools import tool
from langchain.agents import create_tool_calling_agent, AgentExecutor

@tool
def check_pod_status(namespace: str, pod_name: str) -> str:
    """Check the status of a Kubernetes pod in a namespace."""
    return f"Pod {pod_name} in {namespace}: Running, 2/2 containers ready"

# LLM reads docstring to decide when to call the tool
executor = AgentExecutor(agent=agent, tools=[check_pod_status])
result = executor.invoke({"input": "Is api-server running in production?"})
```

**Q: RAG pipeline**

```python
from langchain_text_splitters import RecursiveCharacterTextSplitter
from langchain_openai import OpenAIEmbeddings
from langchain_community.vectorstores import Qdrant

splitter = RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=200)
chunks = splitter.split_documents(docs)
vectorstore = Qdrant.from_documents(chunks, OpenAIEmbeddings())
retriever = vectorstore.as_retriever(search_kwargs={"k": 4})
```

**Q: LangSmith observability**

```python
import os
os.environ["LANGCHAIN_TRACING_V2"] = "true"
os.environ["LANGCHAIN_API_KEY"] = "your-key"
# All LangChain calls traced — shows prompts, tokens, latency, costs
```

## Revision Notes
```
LCEL: prompt | llm | parser (pipe operator)
.invoke() | .stream() | .ainvoke() | .batch()
TOOLS: @tool decorator — LLM reads docstring to decide when to use
AGENT: create_tool_calling_agent + AgentExecutor
RAG: loader -> splitter -> embeddings -> vectorstore -> retriever -> chain
LANGSMITH: LANGCHAIN_TRACING_V2=true -> automatic tracing
```
