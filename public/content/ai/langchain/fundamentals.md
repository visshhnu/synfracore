# LangChain Fundamentals

## Setup

\`\`\`bash
pip install langchain langchain-openai langchain-community
pip install python-dotenv  # For API key management
\`\`\`

\`\`\`python
# .env
OPENAI_API_KEY=sk-...
ANTHROPIC_API_KEY=...
\`\`\`

## Chat Models

\`\`\`python
from langchain_openai import ChatOpenAI
from langchain_anthropic import ChatAnthropic
from dotenv import load_dotenv

load_dotenv()

# OpenAI
llm = ChatOpenAI(
    model="gpt-4o",
    temperature=0,          # 0 = deterministic, 1 = creative
    max_tokens=1000,
)

# Anthropic Claude
llm = ChatAnthropic(
    model="claude-3-5-sonnet-20241022",
    temperature=0,
)

# Basic invocation
response = llm.invoke("What is the capital of France?")
print(response.content)     # "The capital of France is Paris."

# With messages
from langchain_core.messages import HumanMessage, SystemMessage

messages = [
    SystemMessage(content="You are a DevOps expert."),
    HumanMessage(content="Explain Kubernetes in 2 sentences.")
]
response = llm.invoke(messages)
\`\`\`

## Prompt Templates

\`\`\`python
from langchain_core.prompts import ChatPromptTemplate, PromptTemplate

# Simple template
template = ChatPromptTemplate.from_messages([
    ("system", "You are an expert in {domain}. Answer concisely."),
    ("user", "{question}")
])

# Format and inspect
formatted = template.format_messages(
    domain="Kubernetes",
    question="What is a Pod?"
)

# Use in chain
chain = template | llm
response = chain.invoke({
    "domain": "Terraform",
    "question": "What is state locking?"
})
print(response.content)
\`\`\`

## LCEL — LangChain Expression Language

\`\`\`python
from langchain_core.output_parsers import StrOutputParser
from langchain_core.prompts import ChatPromptTemplate
from langchain_openai import ChatOpenAI

# Chain components with |
prompt = ChatPromptTemplate.from_template(
    "Explain {topic} in exactly 3 bullet points."
)
model = ChatOpenAI(model="gpt-4o-mini")
parser = StrOutputParser()  # Extract string from response

chain = prompt | model | parser  # Build the chain

# Invoke
result = chain.invoke({"topic": "Docker containers"})
print(result)

# Stream
for chunk in chain.stream({"topic": "Kubernetes pods"}):
    print(chunk, end="", flush=True)

# Batch (parallel)
results = chain.batch([
    {"topic": "Terraform"},
    {"topic": "Ansible"},
    {"topic": "Jenkins"},
])
\`\`\`

## RAG — Retrieval Augmented Generation

\`\`\`python
from langchain_community.document_loaders import PyPDFLoader, WebBaseLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_openai import OpenAIEmbeddings
from langchain_community.vectorstores import Chroma
from langchain_core.prompts import ChatPromptTemplate
from langchain_openai import ChatOpenAI
from langchain_core.output_parsers import StrOutputParser
from langchain_core.runnables import RunnablePassthrough

# 1. Load documents
loader = PyPDFLoader("kubernetes-docs.pdf")
docs = loader.load()

# 2. Split into chunks
splitter = RecursiveCharacterTextSplitter(
    chunk_size=1000,
    chunk_overlap=200,
)
splits = splitter.split_documents(docs)

# 3. Create embeddings and store in vector DB
embeddings = OpenAIEmbeddings(model="text-embedding-3-small")
vectorstore = Chroma.from_documents(
    documents=splits,
    embedding=embeddings,
    persist_directory="./chroma_db"
)
retriever = vectorstore.as_retriever(
    search_type="similarity",
    search_kwargs={"k": 5}
)

# 4. Build RAG chain
prompt = ChatPromptTemplate.from_template("""
Answer the question based only on the following context:

{context}

Question: {question}

If the answer is not in the context, say "I don't have information about that."
""")

llm = ChatOpenAI(model="gpt-4o")

def format_docs(docs):
    return "\n\n".join(doc.page_content for doc in docs)

rag_chain = (
    {"context": retriever | format_docs, "question": RunnablePassthrough()}
    | prompt
    | llm
    | StrOutputParser()
)

# 5. Query
answer = rag_chain.invoke("How do I configure resource limits in Kubernetes?")
print(answer)
\`\`\`

## Memory — Conversational AI

\`\`\`python
from langchain_community.chat_message_histories import ChatMessageHistory
from langchain_core.chat_history import BaseChatMessageHistory
from langchain_core.runnables.history import RunnableWithMessageHistory
from langchain_core.prompts import ChatPromptTemplate, MessagesPlaceholder

# Session store
store = {}

def get_session_history(session_id: str) -> BaseChatMessageHistory:
    if session_id not in store:
        store[session_id] = ChatMessageHistory()
    return store[session_id]

# Chain with history
prompt = ChatPromptTemplate.from_messages([
    ("system", "You are a helpful DevOps assistant."),
    MessagesPlaceholder(variable_name="history"),
    ("human", "{input}"),
])

chain = prompt | ChatOpenAI(model="gpt-4o-mini") | StrOutputParser()

with_history = RunnableWithMessageHistory(
    chain,
    get_session_history,
    input_messages_key="input",
    history_messages_key="history",
)

# Multi-turn conversation
session = {"configurable": {"session_id": "user-123"}}

r1 = with_history.invoke({"input": "What is Kubernetes?"}, config=session)
r2 = with_history.invoke({"input": "How does it compare to Docker Swarm?"}, config=session)
r3 = with_history.invoke({"input": "Which should I use for a new project?"}, config=session)
# Remembers context from previous messages!
\`\`\`