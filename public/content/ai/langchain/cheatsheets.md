# LangChain — Cheatsheet

```python
# ── INSTALLATION ──────────────────────────────────────────
# pip install langchain langchain-anthropic langchain-openai
# pip install langchain-community chromadb sentence-transformers

# ── LLM SETUP ─────────────────────────────────────────────
from langchain_anthropic import ChatAnthropic
from langchain_openai import ChatOpenAI

llm_claude = ChatAnthropic(model="claude-sonnet-4-6")
llm_openai = ChatOpenAI(model="gpt-4o-mini")

# ── PROMPTS ───────────────────────────────────────────────
from langchain.prompts import ChatPromptTemplate, PromptTemplate

# Chat prompt
prompt = ChatPromptTemplate.from_messages([
    ("system", "You are a {role}."),
    ("human", "{question}")
])

# Format
messages = prompt.format_messages(role="expert", question="What is Kubernetes?")

# ── CHAINS (LCEL) ─────────────────────────────────────────
from langchain.schema.output_parser import StrOutputParser

# Basic chain
chain = prompt | llm_claude | StrOutputParser()
result = chain.invoke({"role": "DevOps expert", "question": "What is K8s?"})

# With batch/streaming/async
results = chain.batch([{"role": "x", "question": "q1"}, {"role": "y", "question": "q2"}])
for chunk in chain.stream({"role": "x", "question": "q"}): print(chunk, end="")
result = await chain.ainvoke({"role": "x", "question": "q"})

# ── RAG ───────────────────────────────────────────────────
from langchain_openai import OpenAIEmbeddings
from langchain_community.vectorstores import Chroma
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain.document_loaders import TextLoader

# Load and split
docs = TextLoader("file.txt").load()
chunks = RecursiveCharacterTextSplitter(chunk_size=500, chunk_overlap=50).split_documents(docs)

# Create vector store
vectorstore = Chroma.from_documents(chunks, OpenAIEmbeddings())
retriever = vectorstore.as_retriever(search_kwargs={"k": 5})

# RAG chain
from langchain.chains import RetrievalQA
qa = RetrievalQA.from_chain_type(llm=llm_claude, retriever=retriever, return_source_documents=True)
result = qa.invoke({"query": "How do I deploy to Kubernetes?"})

# ── AGENTS ────────────────────────────────────────────────
from langchain.agents import create_tool_calling_agent, AgentExecutor
from langchain.tools import tool

@tool
def search_docs(query: str) -> str:
    """Search internal documentation."""
    return retriever.invoke(query)[0].page_content if retriever.invoke(query) else "Not found"

tools = [search_docs]
agent = create_tool_calling_agent(llm_claude, tools, prompt)
executor = AgentExecutor(agent=agent, tools=tools, max_iterations=10)
result = executor.invoke({"input": "Find info about Kubernetes networking"})

# ── MEMORY ────────────────────────────────────────────────
from langchain.memory import ConversationBufferWindowMemory
from langchain.chains import ConversationChain

memory = ConversationBufferWindowMemory(k=5)  # Last 5 turns
conv = ConversationChain(llm=llm_claude, memory=memory)
conv.predict(input="What is Docker?")
conv.predict(input="How does it compare to Kubernetes?")

# ── OUTPUT PARSERS ────────────────────────────────────────
from langchain.schema.output_parser import StrOutputParser
from langchain_core.output_parsers import JsonOutputParser
from langchain.output_parsers import CommaSeparatedListOutputParser, PydanticOutputParser
from pydantic import BaseModel

class JobInfo(BaseModel):
    title: str
    company: str
    skills: list[str]

parser = PydanticOutputParser(pydantic_object=JobInfo)
chain = prompt | llm_claude | parser
result = chain.invoke({"question": "Extract job info: Senior Engineer at Google, needs Python, AWS"})
```
