# LangChain — LLM Application Framework

LangChain is the most widely used framework for building applications powered by Large Language Models (LLMs). It provides abstractions for chains, agents, memory, and retrieval that make production AI systems practical to build.

## What is LangChain?

LangChain is an open-source framework that helps you:
- **Chain** LLM calls together with logic
- **Retrieve** relevant context from documents (RAG)
- **Build agents** that use tools and reason about actions
- **Manage memory** across conversation turns
- **Connect to 100+ data sources** with standardized interfaces

## Core Concepts

**LLMs / Chat Models** — The AI model itself. LangChain supports OpenAI, Anthropic, Google, Mistral, Ollama (local), and 50+ others through a unified interface.

**Prompts** — PromptTemplates with variables. Reusable, testable prompt structures.

**Chains** — Sequences of operations. Input → LLM → Output → Next LLM → Final Output.

**Retrievers** — Fetch relevant documents from a knowledge base for RAG.

**Agents** — LLMs that autonomously decide which tools to use and in what order.

**Memory** — Persist conversation history across turns.

**Tools** — Functions the agent can call (search, calculator, API calls).

## LangChain vs. Raw API

\`\`\`python
# Without LangChain
import openai
response = openai.chat.completions.create(
    model="gpt-4",
    messages=[{"role": "user", "content": f"Answer: {question}"}]
)
# Need to handle: retries, streaming, output parsing, memory, tools...

# With LangChain
from langchain_openai import ChatOpenAI
from langchain_core.prompts import ChatPromptTemplate

llm = ChatOpenAI(model="gpt-4")
prompt = ChatPromptTemplate.from_messages([
    ("system", "You are a helpful assistant."),
    ("user", "{question}")
])
chain = prompt | llm  # LCEL pipe syntax
response = chain.invoke({"question": "What is Kubernetes?"})
# Handles: retries, streaming, type safety, tracing, testing
\`\`\`

## When to Use LangChain

✅ Building RAG systems (document Q&A)  
✅ Multi-step AI workflows  
✅ AI agents with tool use  
✅ Chatbots with memory  
✅ When switching between LLM providers  

⚠️ Consider alternatives (raw API) when:  
- Single LLM call with no chaining  
- Maximum performance/minimal dependencies needed  
- Team unfamiliar with LangChain abstractions