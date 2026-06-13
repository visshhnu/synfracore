# LangChain — Building LLM Applications

LangChain is a framework for building applications powered by language models. It provides abstractions for chains (sequences of LLM calls), tools, memory, and agents that work across any LLM provider.

## Core Concepts

```python
# pip install langchain langchain-anthropic langchain-openai

from langchain_anthropic import ChatAnthropic
from langchain.prompts import ChatPromptTemplate
from langchain.schema.output_parser import StrOutputParser

# 1. The LLM
llm = ChatAnthropic(model="claude-sonnet-4-6")

# 2. Prompt template
prompt = ChatPromptTemplate.from_messages([
    ("system", "You are a {role}. Be concise."),
    ("human", "{question}")
])

# 3. Chain (LCEL - LangChain Expression Language)
chain = prompt | llm | StrOutputParser()

# 4. Invoke
result = chain.invoke({"role": "DevOps expert", "question": "What is Kubernetes?"})
print(result)

# Streaming
for chunk in chain.stream({"role": "DevOps expert", "question": "Explain Docker"}):
    print(chunk, end="", flush=True)

# Batch
results = chain.batch([
    {"role": "expert", "question": "What is Terraform?"},
    {"role": "expert", "question": "What is Ansible?"},
])
```

## RAG with LangChain

```python
from langchain_anthropic import ChatAnthropic
from langchain_openai import OpenAIEmbeddings
from langchain_community.vectorstores import Chroma
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain.chains import RetrievalQA
from langchain.document_loaders import DirectoryLoader, TextLoader

# Load documents
loader = DirectoryLoader("./docs", glob="**/*.md", loader_cls=TextLoader)
documents = loader.load()

# Split into chunks
splitter = RecursiveCharacterTextSplitter(chunk_size=500, chunk_overlap=50)
chunks = splitter.split_documents(documents)

# Create vector store
embeddings = OpenAIEmbeddings(model="text-embedding-3-small")
vectorstore = Chroma.from_documents(chunks, embeddings, persist_directory="./chroma_db")

# Build RAG chain
llm = ChatAnthropic(model="claude-sonnet-4-6")
qa_chain = RetrievalQA.from_chain_type(
    llm=llm,
    retriever=vectorstore.as_retriever(search_kwargs={"k": 5}),
    return_source_documents=True
)

result = qa_chain.invoke({"query": "How do I deploy to Kubernetes?"})
print(result["result"])
print("Sources:", [d.metadata["source"] for d in result["source_documents"]])
```

## Memory and Conversation History

```python
from langchain.memory import ConversationBufferWindowMemory
from langchain.chains import ConversationChain

memory = ConversationBufferWindowMemory(k=10)  # Keep last 10 turns

conversation = ConversationChain(
    llm=ChatAnthropic(model="claude-sonnet-4-6"),
    memory=memory,
    verbose=False
)

conversation.predict(input="What is Docker?")
conversation.predict(input="How is it different from Kubernetes?")
conversation.predict(input="Which should I learn first?")
# Model remembers the entire conversation context
```
